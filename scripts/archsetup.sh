#!/bin/bash

#Packages
archPackages="audacity base-devel bitwarden bluez bluez-utils cinnamon cups dosfstools exfat-utils 
              filezilla flameshot freecad gimp git gnome gnome-extra gtk4 hplip htop libreoffice-fresh 
              neofetch ntfs-3g obs-studio p7zip python qbittorrent radicale signal-desktop sqlitebrowser 
              steam system-config-printer thunderbird timeshift veracrypt vim vlc 
              wireshark-qt nvidia nvidia-settings nvidia-utils"
yayPackages="backintime clion drawio github-desktop librewolf-bin minecraft-launcher pycharm-professional 
             qflipper visual-studio-code zoom"

# Function to print text in bright blue
print_bright_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

# Remove shit
sudo echo "Removing Bloat"
sudo pacman -Rsu welcome
sudo echo "Bloat Removed"

# Installing official arch packages (maybe later automate the options selections)
sudo echo "Installing Arch Packages"
sudo pacman -Syu $archPackages
sudo echo "Arch Packages Installed"

# System services, starting and enabling them
sudo echo "Starting And Enabling System Services"
sudo systemctl start bluetooth.service || exit
sudo systemctl enable bluetooth.service || exit
sudo systemctl start cups.service || exit
sudo systemctl enable cups.service || exit
echo "System Service Started And Enabled"

# Installing yay
echo "Installing Yay"
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
sudo echo "Installing Aur Packages"
#echo -e 'A\nN\n' | yay -S drawio clion github-desktop librewolf-bin nordvpn-bin pycharm-professional qflipper visual-studio-code zoom --noconfirm
yay -S $yayPackages 
sudo echo "Aur Packages Installed"

# Flagging script as being concluded
print_bright_blue "Setup Finished ;) Now just add flameshot, deja dup and timeshift to startup. Maybe a theme???"
