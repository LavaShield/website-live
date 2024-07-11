#!/bin/bash

# Package Groups
general_Packages="cinnamon dosfstools exfat-utils git gnome gnome-extra htop ntfs-3g
                  p7zip python timeshift vim nvidia nvidia-settings nvidia-utils"
general_Aur_Packages="backintime librewolf-bin"
desktop_Packages="audacity base-devel bitwarden bluez bluez-utils cmake code cups 
                  filezilla flameshot freecad gcc gimp gtk4 hplip jdk21-openjdk 
                  libreoffice-fresh neofetch obs-studio openjdk21-doc openjdk21-src
                  qbittorrent radicale signal-desktop sqlitebrowser steam
                  system-config-printer thunderbird veracrypt vlc wireshark-qt"
desktop_Aur_Packages="clion clion-jre clion-cmake clion-gdb clion-lldb drawio 
                      github-desktop intellij-idea-ultimate-edition
                      minecraft-launcher pycharm-professional qflipper
                      visual-studio-code zoom"
server_Packages=""
server_Aur_Packages=""

# Function to print text in bright blue
print_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

# Function to install Arch Linux packages
install_packages() {
    print_blue "Installing $2 Official Arch Packages"
    pacman -Syu $1
    print_blue "$2 Official Arch Packages Installed"
}

# Function to install AUR packages using yay
install_aur_packages() {
    print_blue "Installing $2 Aur Packages"
    yay -S $1
    print_blue "$2 Aur Packages Installed"
}

general() {
    # Remove Bloat
    print_blue "Removing Bloat"
    pacman -Rsu welcome
    print_blue "Bloat Removed"

    # Installing Yay
    print_blue "Installing Yay"
    cd ~/Downloads || exit
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    {
        printf 'y\n'  # Send 'y' and Enter for the [Y/n] prompt
    } | makepkg -si --noconfirm
    cd ..
    rm -rf yay
    print_blue "Yay Installed"

    # Install General Packages
    install_packages $general_Packages "General"

    # Install General Aur Packages
    install_aur_packages $general_Aur_Packages "General"
}

# Function to setup server environment
setup_server() {
    # Install Server Packages
    install_packages $server_Packages "Server"

    # Install Server Aur Packages
    install_aur_packages $server_Aur_Packages "Server"
}

# Function to setup desktop environment
setup_desktop() {

    # Install Desktop Packages
    install_packages $desktop_Packages "Desktop"
    
    # Install Desktop Aur Packages
    install_aur_packages $desktop_Aur_Packages "Desktop"

    # Desktop System services, starting and enabling them
    echo "Starting And Enabling System Services"
    systemctl start bluetooth.service || exit
    systemctl enable bluetooth.service || exit
    systemctl start cups.service || exit
    systemctl enable cups.service || exit
    echo "System Service Started And Enabled"
}

# ------Main script starts here------
sudo echo "Welcome to the ArchLinux setup script!"
echo "What would you like to setup?"
echo "1. Server setup"
echo "2. Desktop setup"
read -p "Enter your choice (1/2): " setup_choice

# Run the generalised commands
general

case $setup_choice in
    1)
        setup_server
        ;;
    2)
        setup_desktop
        ;;
    *)
        echo "Invalid choice. Please choose either 1 or 2."
        exit 1
        ;;
esac

# Flagging script as being concluded
print_blue "Setup Finished ;) Now just add flameshot, back in time and timeshift to startup. Maybe a theme???"
