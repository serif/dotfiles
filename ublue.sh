#!/bin/bash

# rpm-copr - copr for rpm-ostree
# https://github.com/34N0/rpm-copr
curl -L https://github.com/34N0/rpm-copr/releases/download/v0.9-beta/rpm-copr-v0.9-beta-linux-amd64.tar.gz | sudo tar zx -C /usr/local/bin

# keyd - key remapper
# https://github.com/rvaiya/keyd
# https://copr.fedorainfracloud.org/coprs/alternateved/keyd/
# also installing:
# kvantum - theme engine
sudo rpm-copr enable alternateved/keyd
sudo rpm-ostree install keyd kvantum
sudo mkdir /etc/keyd

# Flatpak themes
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --env=GTK_THEME=WhiteSur-Dark-orange
sudo flatpak override --env=ICON_THEME=WhiteSur-orange-dark

echo TODO:
# https://github.com/rvaiya/keyd/issues/812
echo sudo reboot now
echo Then:
echo sudoedit /etc/keyd/default.conf
echo sudo systemctl restart keyd
echo sudo keyd reload
