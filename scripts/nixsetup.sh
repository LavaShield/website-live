#!/bin/bash

# Function to print text in bright blue
print_bright_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

# Installing nix packages
echo "Installing Nix Packages..."
packages="audacity bitwarden-desktop gnome.cheese deja-dup drawio filezilla flameshot
          freecad gimp git github-desktop jetbrains.clion jetbrains.pycharm-professional
          libreoffice-fresh librewolf neofetch obs-studio python3 qbittorrent qFlipper
          signal-desktop sqlitebrowser steam thunderbird timeshift veracrypt vim
          virtualbox vlc vscode wireshark" # Add more packages separated by spaces
for package in $packages; do
    nix-env -iA nixos.$package
done
echo "Nix Packages Installed."

# Flagging script as being concluded
print_bright_blue "Setup Finished ;)"

# archlinux package Δ's
# + cheese deja-dup
# - bluez bluez-utils cinnamon cups dosfstools exfat-utils gnome 
#   gnome-extra hplip nordvpn-bin ntfs-3g nvidia nvidia-settings 
#   nvidia-utils p7zip system-config-printer zoom
