#!/bin/bash

# Install Yay
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay && cd ~/Downloads/yay && makepkg -si --noconfirm && sudo rm -rf ~/Downloads/yay


# Archlinux Packages
sudo pacman -Sy \
bitwarden firefox signal-desktop audacity chromium dolphin flameshot freecad gimp kdenlive kiwix-desktop libreoffice-fresh \
obs-studio opensnitch python qbittorrent thunderbird timeshift vim vlc jdk21-openjdk openjdk21-doc openjdk21-src \



# Yay Packages
yay -S librewolf nordvpn-bin cemu backintime





# Enable Services
# sudo systemctl start --now opensnitch.service
# sudo systemctl enable --now opensnitch.service


# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"
