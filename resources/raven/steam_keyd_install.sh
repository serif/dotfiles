#!/bin/bash
# Installs keyd and Raven layout on SteamOS

# Script exit on error
set -euxo pipefail

# Unlock
sudo steamos-readonly disable

# Deploy config
sudo ln -s "$(pwd)/etc/keyd" "/etc/"

# Prepare Pacman
sudo pacman-key --init
sudo pacman-key --populate archlinux

# Add external (non-Steam) Arch Extra repo
EXTRA="Server = http://mirrors.cat.pdx.edu/archlinux/\$repo/os/\$arch"
echo $EXTRA | sudo tee /etc/pacman.d/extra > /dev/null
sudo bash -c 'echo -e "\n[extra]" >> /etc/pacman.conf'
sudo bash -c 'echo -e "\nInclude = /etc/pacman.d/extra" >> /etc/pacman.conf'

# Synchronize package databases
sudo pacman -Sy

# SigLevel = TrustAll
sudo sed -i 's/^SigLevel.*/SigLevel = TrustAll/' /etc/pacman.conf

# Install keyd
sudo pacman -S --noconfirm keyd

# Revert change: SigLevel = Required DatabaseOptional
sudo sed -i 's/^SigLevel.*/SigLevel = Required DatabaseOptional/' /etc/pacman.conf

# Remove external Arch Extra repo
sudo sed -i '/^\[extra\]/d' /etc/pacman.conf
sudo sed -i '/^Include = \/etc\/pacman.d\/extra/d' /etc/pacman.conf
sudo rm /etc/pacman.d/extra

# Lock
sudo steamos-readonly enable

# Bangarang
sudo systemctl restart keyd

# Reminder: after config change:
# sudo keyd reload

# Reminder: find hw ids and keys:
# sudo keyd monitor


