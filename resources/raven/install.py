#!/usr/bin/python3
# distrobox weirdness:
# no sudo for /usr/bin/env python3


import re
import os
import shutil


# Filenames
symbols_src_file = 'src_fragment_symbols'
symbols_os_file = '/usr/share/X11/xkb/symbols/us'
evdev_src_file = 'src_fragment_evdev'
evdev_os_file = '/usr/share/X11/xkb/rules/evdev.xml'
test_symbols = 'test_symbols'
test_evdev = 'test_evdev'


# Check if files exist
if not os.path.exists(symbols_os_file):
    print(f'Connot find {symbols_os_file}')
    exit()
if not os.path.exists(evdev_os_file):
    print(f'Connot find {evdev_os_file}')
    exit()


# Generate in local folder if not root
if not os.geteuid() == 0:
    print('!! This script must be run as root !!')
    print('  Running test mode in local folder')
    shutil.copy(symbols_os_file, test_symbols)
    shutil.copy(evdev_os_file, test_evdev)
    symbols_os_file = test_symbols
    evdev_os_file = test_evdev


# Check if files are writeable
access_error = False
if not os.access(symbols_os_file, os.W_OK):
    print(f'Cannot write to {symbols_os_file}')
    access_error = True
if not os.access(evdev_os_file, os.W_OK):
    print(f'Cannot write to {evdev_os_file}')
    access_error = True
if access_error:
    print('If on SteamOS, try:')
    print('sudo steamos-readonly disable')
    print('sudo ./install.py')
    print('sudo steamos-readonly enable')
    exit()


# append raven definition to us symbols
def symbols_append():
    print(f'Appending raven to {symbols_os_file}')
    # Check if already installed
    with open(symbols_os_file, 'r') as file:
        symbols_os = file.read()
        if 'raven' in symbols_os:
            print(f'Raven exists in {symbols_os_file}')
            return
    # read symbols_src_file
    with open(symbols_src_file, 'r') as file:
        symbols_src = file.read()
    # append to symbols_os_file
    with open(symbols_os_file, 'a') as file:
        file.write(symbols_src)
symbols_append()


# insert raven listing into evdev us section
def evdev_insert():
    print(f'Inserting raven into {evdev_os_file}')
    # Read files
    with open(evdev_src_file, 'r') as file:
        evdev_src = file.read()
    with open(evdev_os_file, 'r') as file:
        evdev_os = file.read()
        # Check if already installed
        if 'raven' in evdev_os:
            print(f'Raven exists in {evdev_os_file}')
            return
    # Find insert position
    pattern = r'<layoutList>.+<layout>.+<configItem>.+<name>us<\/name>.+<variantList>'
    match = re.search(pattern, evdev_os, flags=re.DOTALL)
    if match:
        insert_position = match.end()
    else:
        print("Unable to locate evdev insert location")
        return
    # Insert raven
    new_evdev_os = evdev_os[:insert_position]
    new_evdev_os += evdev_src
    new_evdev_os += evdev_os[insert_position:]
    # Write os file with changes
    with open(evdev_os_file, 'w') as file:
        file.write(new_evdev_os)
evdev_insert()


print('Done')
print('\nIf not using GUI settings, try:')
print('setxkbmap -layout us -variant raven')
