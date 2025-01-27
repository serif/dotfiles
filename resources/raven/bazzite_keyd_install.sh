#!/bin/bash
# Installs keyd and Raven layout on Bazzite

# Deploy config
sudo ln -s "$(pwd)/etc/keyd" "/etc/"

# rpm-copr - copr for rpm-ostree
# Needed since on Fedora Ublue images,
# dnf is just an alias to rpm-ostree
# https://github.com/34N0/rpm-copr
curl -L https://github.com/34N0/rpm-copr/releases/download/v0.9-beta/rpm-copr-v0.9-beta-linux-amd64.tar.gz | sudo tar zx -C /usr/local/bin

# keyd - key remapper
# https://github.com/rvaiya/keyd
# https://copr.fedorainfracloud.org/coprs/alternateved/keyd/
sudo rpm-copr enable alternateved/keyd
sudo rpm-ostree install keyd

# Restart reminder
echo System must restart to layer new package
echo TODO:
echo sudo reboot now
echo sudo systemctl enable keyd
echo sudo systemctl restart keyd

# Reminder: after config change:
# sudo keyd reload

# Reminder: find hw ids and keys:
# sudo keyd monitor
