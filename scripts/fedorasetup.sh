#!/bin/bash

# Package Groups
general_Packages="base-devel cinnamon curl dosfstools exfat-utils gcc git gnome 
                  gnome-extra htop nodejs ntfs-3g p7zip php python tailscale timeshift tmux 
                  gvim nvidia nvidia-settings nvidia-utils"
general_Aur_Packages="backintime librewolf-bin nordvpn-bin"
desktop_Packages="audacity bitwarden bluez bluez-utils code cups 
                  filezilla flameshot freecad gimp hplip 
                  libreoffice-fresh neofetch obs-studio
                  qbittorrent signal-desktop sqlitebrowser steam
                  system-config-printer thunderbird veracrypt vlc wireshark-qt"
desktop_Aur_Packages="drawio minecraft-launcher qflipper"
server_Packages="docker docker-compose openssh ufw"
server_Aur_Packages=""

# Function to print text in bright blue
print_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

# Function to install Arch Linux packages
install_packages() {
    print_blue "Installing $1 Official Arch Packages"
    sudo pacman -Syu $2
    print_blue "$1 Official Arch Packages Installed"
}

# Function to install AUR packages using yay
install_aur_packages() {
    print_blue "Installing $1 Aur Packages"
    yay -S $2
    print_blue "$1 Aur Packages Installed"
}

general() { 
    # Remove Bloat
    print_blue "Removing Bloat"
    sudo pacman -Rsu welcome
    print_blue "Bloat Removed"

    # Install General Packages
    install_packages "General" "$general_Packages"

    # Installing Yay
    print_blue "Installing Yay"
    cd ~/Downloads || exit
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit
    {
        printf 'y\n'  # Send 'y' and Enter for the [Y/n] prompt
    } | makepkg -si --noconfirm
    cd ..
    sudo rm -rf yay
    print_blue "Yay Installed"

    # Install General Aur Packages
    install_aur_packages "General" "$general_Aur_Packages"

    # Tailscale General Setup
    sudo systemctl enable --now tailscaled
    sudo tailscale up
    sudo tailscale ip -4
    # https://tailscale.com/download/linux/arch

    # add copy paste to gvim
    printf "set clipboard=unnamedplus\n" >> ~/.vimrc

}

# Function to setup server environment
setup_server() {
    # Install Server Packages
    install_packages "Server" "$server_Packages"

    # Install Server Aur Packages
    install_aur_packages "Server" "$server_Aur_Packages"

    # Server System services, starting and enabling them
    echo "Starting And Enabling Server System Services"
    sudo systemctl start sshd || exit
    sudo systemctl enable sshd || exit
    sudo systemctl enable docker
    sudo systemctl start docker 
    echo "Server System Service Started And Enabled"

    # Allow ssh connections
    print_blue "Allowing SSH Connections"
    sudo ufw allow ssh
    sudo ufw enable
    print_blue "SSH Connections Allowed"
    ### to configure ssh go to /etc/ssh/sshd_config
}

# Function to setup desktop environment
setup_desktop() {

    # Install Desktop Packages
    install_packages "Desktop" "$desktop_Packages"
    
    # Install Desktop Aur Packages
    install_aur_packages "Desktop" "$desktop_Aur_Packages"

    # Desktop System services, starting and enabling them
    echo "Starting And Enabling Desktop System Services"
    sudo systemctl start bluetooth.service || exit
    sudo systemctl enable bluetooth.service || exit
    sudo systemctl start cups.service || exit
    sudo systemctl enable cups.service || exit
    echo "Desktop System Service Started And Enabled"
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
print_blue "Setup Finished ;)"
print_blue "Now for tailscale, go to /usr/lib/sysctl.d/50-default.conf and then make sure these conditions 
            are set in the config file: \"net.ipv4.conf.default.rp_filter = 1\", 
            \"net.ipv4.conf.all.rp_filter = 1\" (here for more details, https://tailscale.com/download/linux/arch)"
print_blue "Additionally go to vim and then execute this command ':set clipboard=unnamedplus'"
print_blue "Now just add flameshot, back in time and timeshift to startup. Maybe a theme???"
