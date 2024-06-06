#!/bin/bash

#Packages
archPackages="audacity bitwarden bluez bluez-utils cinnamon cups dosfstools exfat-utils 
              filezilla flameshot freecad gimp git gnome gnome-extra hplip htop libreoffice-fresh 
              neofetch ntfs-3g obs-studio p7zip python qbittorrent signal-desktop sqlitebrowser 
              steam system-config-printer thunderbird timeshift veracrypt vim virtualbox vlc 
              wireshark-qt nvidia nvidia-settings nvidia-utils"
yayPackages="drawio clion github-desktop librewolf-bin nordvpn-bin pycharm-professional 
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

# Downloading And Activating Cinnamon Themes
echo "Installing And Activating Cinnamon Themes"
is_theme_installed() {
    if [ -d "$HOME/.themes/$1" ]; then
        return 0
    else
        return 1
    fi
}
install_theme() {
    echo "Installing $1 theme..."
    git clone "$2" "$HOME/.themes/$1"
}
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install git and try again."
    exit 1
fi
if ! is_theme_installed "Mint-X"; then
    install_theme "Mint-X" "https://github.com/linuxmint/mint-themes.git"
fi
if ! is_theme_installed "Mint-Y"; then
    install_theme "Mint-Y" "https://github.com/linuxmint/mint-y-theme.git"
fi
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y"
echo "Mint-Y theme activated."
echo "Cinnamon Themes Installed And Activated"


# Flagging script as being concluded
print_bright_blue "Setup Finished ;) Now just add flameshot and timeshift to startup."
