#!/bin/bash

# Archlinux Packages
sudo pacman -Sy \
bitwarden firefox signal-desktop audacity


# Install Yay
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay && cd ~/Downloads/yay && makepkg -si --noconfirm && sudo rm -rf ~/Downloads/yay


# Yay Packages









# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"
