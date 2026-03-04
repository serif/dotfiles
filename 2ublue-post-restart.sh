#!/bin/bash

mkdir ../ext
cd ../ext

# https://github.com/vinceliuice/WhiteSur-gtk-theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd Whitesur-gtk-theme
./install.sh -c Dark -t orange
cd ..

# https://github.com/vinceliuice/WhiteSur-kde
git clone https://github.com/vinceliuice/WhiteSur-kde.git
cd WhiteSur-kde
./install.sh
cd ..

