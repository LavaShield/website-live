#!/bin/bash


# Archlinux Packages
sudo pacman -Sy \
bitwarden firefox signal-desktop audacity chromium dolphin flameshot freecad gimp kdenlive kiwix-desktop libreoffice-fresh \
obs-studio opensnitch python qbittorrent thunderbird timeshift vim vlc jdk21-openjdk openjdk21-doc openjdk21-src \
nodejs git code drawio-desktop handbrake veracrypt bluez bluez-utils cups system-config-printer cinnamon gnome \
gnome-extra nodejs ntfs-3g gvim timeshift exfat-utils htop dosfstools curl p7zip


# Install Yay
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay && cd ~/Downloads/yay && makepkg -si --noconfirm && sudo rm -rf ~/Downloads/yay


# Yay Packages
yay -S librewolf nordvpn-bin backintime github-desktop minecraft-launcher pcsx2-git yt-dlg


# System Specific Packages
sudo pacman -Syu \
intel-ucode nvidia nvidia-settings nvidia-utils lib32-nvidia-utils intel-media-driver vulkan-intel lib32-vulkan-intel \


# Enable Services
# sudo systemctl start --now opensnitch, cups, bluetooth
# sudo systemctl enable --now opensnitch, cups, bluetooth


# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"
