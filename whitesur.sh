#!/bin/bash
# WhiteSur

# Prep
mkdir ../ext
cd ../ext
sudo flatpak override --filesystem=xdg-config/gtk-3.0 && sudo flatpak override --filesystem=xdg-config/gtk-4.0

# WhiteSur-gtk-theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git --depth=1
cd WhiteSur-gtk-theme
./install.sh -c Dark -t orange -t green -t blue
cd ..

# WhiteSur-kde
git clone https://github.com/vinceliuice/WhiteSur-kde.git --depth=1
cd WhiteSur-kde
./install.sh -c dark
cd ..

# WhiteSur-icon-theme
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git --depth=1
cd WhiteSur-icon-theme
./install.sh -c dark -t orange -a
./install.sh -c dark -t orange -a
cd ..

