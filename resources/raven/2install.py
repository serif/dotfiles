#!/usr/bin/env python3
import os
import shutil
import subprocess
import xml.etree.ElementTree as ET


def main():
    # TODO remove after testing
    # switch_layout()
    # return
    # ~/.config/kxkbrc

    f = Files()
    f.readonly('disable')
    f.safe_write(add_symbols)
    f.safe_write(add_evdev)
    f.readonly('enable')
    switch_layout()


class Files:
    def __init__(self):
        self.symbols_src = 'src_fragment_symbols'
        self.symbols_os = '/usr/share/X11/xkb/symbols/us'
        self.evdev_src = 'src_fragment_evdev'
        self.evdev_os = '/usr/share/X11/xkb/rules/evdev.xml'
        self.test_symbols = 'test_symbols'
        self.test_evdev = 'test_evdev'
        self.is_root = (os.geteuid() == 0)
        self.unlock = self.detect_unlock()
        if not self.is_root:
            print('🚫 This script must be run as root')
            print('✅ Running test mode in local folder')
            shutil.copy(self.symbols_os, self.test_symbols)
            shutil.copy(self.evdev_os, self.test_evdev)
            self.symbols_os = self.test_symbols
            self.evdev_os = self.test_evdev

    def detect_unlock(self):
        if shutil.which('steamos-readonly'):
            return 'steamos'
        if shutil.which('ostree'):
            return 'ostree'
        return None

    def readonly(self, mode):
        if not mode == 'disable':
            mode = 'enable'
        if not self.is_root:
            return
        if self.unlock == 'steamos':
            cmd = f'sudo steamos-readonly {mode}'
        elif self.unlock == 'ostree':
            cmd = f'sudo ostree admin unlock --hotfix'
            if mode == 'enable':
                return  # No need to re-enable readonly with ostree
        else:
            return
        res = subprocess.run(cmd.split(), check=True)
        status = '🚫' if res.returncode else '✅'
        lock = '🔓' if mode == 'disable' else '🔒'
        print(status, lock, cmd)

    def safe_write(self, function):
        try:
            function(self)
            return 0
        except FileNotFoundError as e:
            print(f'🚫 File not found: {e.filename}')
        except PermissionError as e:
            print(f'🚫 Permission denied: {e.filename}')
        return 1


def raven_in(fname):
    with open(fname, 'r') as file:
        if 'raven' in file.read():
            print(f'✅ Raven already in {fname}')
            return True
    return False


def add_symbols(f):
    if raven_in(f.symbols_os):
        return
    with open(f.symbols_os, 'r+') as file:
        symbols_os = file.read()
        with open(f.symbols_src, 'r') as src_file:
            symbols_src = src_file.read()
        file.write(symbols_src)
        print(f'✅ Raven added to {f.symbols_os}')


def indent_xml(elem, level=0):
    no = lambda e: e is None or not e.strip()
    indent = '\n' + '  '*level
    if no(elem.tail):
        elem.tail = indent
    if len(elem):
        if no(elem.text):
            elem.text = indent + '  '
        for elem in elem:
            indent_xml(elem, level + 1)
        if no(elem.tail):
            elem.tail = indent


def add_evdev(f):
    if raven_in(f.evdev_os):
        return

    tree = ET.parse(f.evdev_os)
    root = tree.getroot()
    target_layout = None
    for layout in root.find('layoutList'):
        config_item = layout.find('configItem')
        if config_item is not None:
            name = config_item.find('name')
            short_description = config_item.find('shortDescription')
            if name is None or short_description is None:
                continue
            if name.text == 'us' and short_description.text == 'en':
                target_layout = layout
                break
    if target_layout is None:
        print(f'🚫 Could not find target_layout in {f.evdev_os}')
        return
    variant_list = target_layout.find('variantList')
    if variant_list is None:
        print(f'🚫 Could not find variantList in {f.evdev_os}')
        return

    new_variant = ET.Element('variant')
    config_item = ET.Element('configItem')
    name = ET.Element('name')
    desc = ET.Element('description')
    name.text = 'raven'
    desc.text = 'Raven (US)'
    config_item.append(name)
    config_item.append(desc)
    new_variant.append(config_item)
    variant_list.append(new_variant)
    indent_xml(root)

    with open(f.evdev_os, 'wb') as file:
        file.write(b'<?xml version="1.0" encoding="UTF-8"?>\n')
        file.write(b'<!DOCTYPE xkbConfigRegistry SYSTEM "xkb.dtd">\n')
        tree.write(file, encoding='utf-8')
    print(f'✅ Raven added to {f.evdev_os}')


def switch_layout():
    session = os.getenv('XDG_SESSION_TYPE')

    if session == 'x11':
        cmd_setxkbmap = 'setxkbmap -layout us -variant raven -option ctrl:swapcaps'
        subprocess.run(cmd_setxkbmap.split(), check=True)
        print('✅', cmd_setxkbmap)
    elif session == 'wayland':
        if os.getenv('XDG_CURRENT_DESKTOP') == 'GNOME':
            # GNOME Wayland
            ## Layout
            cmd_gnome_layout = [
                'gsettings', 'set', 'org.gnome.desktop.input-sources', 'sources',
                "[('xkb', 'us(raven)')]"
            ]
            subprocess.run(cmd_gnome_layout, check=True)
            print('✅', ' '.join(cmd_gnome_layout))

            ## Caps Lock
            cmd_gnome_capslock = [
                'gsettings', 'set', 'org.gnome.desktop.input-sources', 'xkb-options',
                "['ctrl:swapcaps']"
            ]
            subprocess.run(cmd_gnome_capslock, check=True)
            print('✅', ' '.join(cmd_gnome_capslock))
        else:
            # KDE Wayland
            kwriteconfig = ''
            for c in ['6', '5']:
                k = 'kwriteconfig' + c
                if shutil.which(k):
                    kwriteconfig = k
                    break
            if kwriteconfig:
                ## Layout
                cmd_kde_layout = [
                    kwriteconfig,
                    '--file', 'kcminputrc',
                    '--group', 'Keyboard',
                    '--key', 'Layout',
                    '\'us(raven)\''
                ]
                subprocess.run(cmd_kde_layout, check=True)
                print('✅', ' '.join(cmd_kde_layout))

                ## Caps Lock
                cmd_kde_capslock = [
                    kwriteconfig,
                    '--file', 'kcminputrc',
                    '--group', 'Keyboard',
                    '--key', 'Options',
                    'ctrl:swapcaps'
                ]
                subprocess.run(cmd_kde_capslock, check=True)
                print('✅', ' '.join(cmd_kde_capslock))

                # Apply the settings
                cmd_kde_apply = ['qdbus', 'org.kde.KWin', '/KWin', 'reconfigure']
                subprocess.run(cmd_kde_apply, check=True)
                print('✅', ' '.join(cmd_kde_layout))


if __name__ == '__main__':
    main()

