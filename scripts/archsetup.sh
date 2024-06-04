#!/bin/bash

# Function to print text in bright blue
print_bright_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

# Installing official arch packages
echo -e '\n\nY\n' | sudo pacman -Syu audacity bitwarden bluez bluez-utils cinnamon cups dosfstools exfat-utils filezilla flameshot freecad gimp git gnome gnome-extra hplip libreoffice-fresh neofetch ntfs-3g obs-studio p7zip python qbittorrent signal-desktop sqlitebrowser steam system-config-printer thunderbird timeshift veracrypt vim virtualbox vlc wireshark-qt nvidia nvidia-settings nvidia-utils

# System services, starting and enabling them
sudo echo "starting and enabling system services"
sudo systemctl start bluetooth.service || exit
sudo systemctl enable bluetooth.service || exit
sudo systemctl start cups.service || exit
sudo systemctl enable cups.service || exit
echo "system service started and enabled"


# Installing yay
echo "installing yay"
cd ~/Downloads || exit
git clone https://aur.archlinux.org/yay.git
cd yay || exit
{
    printf 'y\n'  # Send 'y' and Enter for the [Y/n] prompt
} | makepkg -si --noconfirm
cd ..
rm -rf yay
echo "yay installed"

# Install yay packages
echo -e 'A\nN\n' | yay -S drawio clion github-desktop librewolf-bin nordvpn-bin pycharm-professional qflipper visual-studio-code zoom --noconfirm


# Flagging script as being concluded
print_bright_blue "Setup Finished ;)"
