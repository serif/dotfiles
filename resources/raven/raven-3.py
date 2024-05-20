#!/usr/bin/env python3
# distrobox weirdness:
# no sudo for /usr/bin/env python3


import re
import os
import shutil
import subprocess

# Filenames
symbols_src_file = 'src_fragment_symbols'
symbols_os_file = '/usr/share/X11/xkb/symbols/us'
evdev_src_file = 'src_fragment_evdev'
evdev_os_file = '/usr/share/X11/xkb/rules/evdev.xml'
test_symbols = 'test_symbols'
test_evdev = 'test_evdev'

# Generate in local folder if not root
is_root = (os.geteuid() == 0)
if not is_root:
    print('🚫 This script must be run as root')
    print('✅ Running test mode in local folder')
    shutil.copy(symbols_os_file, test_symbols)
    shutil.copy(evdev_os_file, test_evdev)
    symbols_os_file = test_symbols
    evdev_os_file = test_evdev

# Check if steamos-readonly command exists and disable if needed
is_steamos_rw = False
if is_root and shutil.which('steamos-readonly'):
    subprocess.run(['sudo', 'steamos-readonly', 'disable'], check=True)
    print('✅ 🔓 steamos-readonly disable')
    is_steamos_rw = True

try:
    # Append raven definition to us symbols
    with open(symbols_os_file, 'r+') as file:
        symbols_os = file.read()
        if 'raven' not in symbols_os:
            print(f'Appending raven to {symbols_os_file}')
            with open(symbols_src_file, 'r') as src_file:
                symbols_src = src_file.read()
            file.write(symbols_src)
        else:
            print(f'✅ Raven exists in {symbols_os_file}')

    # Insert raven declaration into evdev us section
    with open(evdev_os_file, 'r+') as file:
        evdev_os = file.read()
        if 'raven' not in evdev_os:
            print(f'✅ Inserting raven into {evdev_os_file}')
            with open(evdev_src_file, 'r') as src_file:
                evdev_src = src_file.read()
            match = re.search(r'<name>us<\/name>\s*<variantList>', evdev_os, re.DOTALL)
            if match:
                evdev_os = evdev_os[:match.end()] + '\n' + evdev_src + evdev_os[match.end():]
                file.seek(0)
                file.write(evdev_os)
            else:
                print(f'🚫 Could not find the insertion point in {evdev_os_file}')
        else:
            print(f'✅ Raven exists in {evdev_os_file}')

except FileNotFoundError as e:
    print(f'🚫 File not found: {e.filename}')
    exit(1)
except PermissionError as e:
    print(f'🚫 Permission denied: {e.filename}')
    exit(1)

# Re-enable SteamOS readonly mode if it was disabled
if is_steamos_rw:
    subprocess.run(['sudo', 'steamos-readonly', 'enable'], check=True)
    print('✅ 🔒 steamos-readonly enable')

# Run setxkbmap command to switch to the raven variant
cmd_setxkbmap = 'setxkbmap -layout us -variant raven -option ctrl:swapcaps'
subprocess.run(cmd_setxkbmap.split(), check=True)
print('✅', cmd_setxkbmap)



    # Find insert position
    # pattern = r'<layout>.+<configItem>.+<name>us<\/name>.+<variantList>'
    # pattern = r'<name>us<\/name>.+<variantList>'
    # match = re.search(pattern, evdev_os, flags=re.DOTALL)
    # if match:
    #     insert_position = match.end()
    # else:
    #     print('Unable to locate evdev insert location')
    #     return
    # # Insert raven
    # new_evdev_os = evdev_os[:insert_position]
    # new_evdev_os += evdev_src
    # new_evdev_os += evdev_os[insert_position:]
    # # Write os file with changes
    # with open(evdev_os_file, 'w') as file:
    #     file.write(new_evdev_os)
