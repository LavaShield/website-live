#!/bin/bash

# Package Groups
general_Packages="base-devel cinnamon curl dosfstools exfat-utils gcc git gnome 
                  gnome-extra htop jdk21-openjdk love lua luajit luarocks man-db man-pages nodejs ntfs-3g openjdk21-doc 
                  openjdk21-src p7zip php python tailscale timeshift tmux gvim 
                  nvidia nvidia-settings nvidia-utils"
general_Aur_Packages="backintime librewolf-bin nordvpn-bin"
desktop_Packages="audacity bitwarden bluez bluez-utils code cups 
                  filezilla flameshot freecad gimp hplip 
                  libreoffice-fresh neofetch obs-studio opensnitch 
                  qbittorrent signal-desktop sqlitebrowser steam
                  system-config-printer thunderbird veracrypt vlc wireshark-qt"
desktop_Aur_Packages="brother-hll2460dw drawio minecraft-launcher qflipper"
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
    sudo systemctl enable bluetooth.service || exit # Bluetooth services
    sudo systemctl start bluetooth.service || exit 
    sudo systemctl enable cups.service || exit # Printing services
    sudo systemctl start cups.service || exit 
    sudo systemctl enable --now opensnitchd || exit # Little Snitch services
    sudo systemctl start opensnitchd || exit 
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





------------------------- UBUNTU SETUP -------------------------
#!/bin/bash
general_apt_packages=""
general_snap_packages=""

server_apt_packages=""
server_snap_packages="docker"

desktop_apt_packages="wireshark gimp vlc qbittorrent filezilla flameshot curl"
desktop_snap_packages="steam thunderbird code bitwarden"
# --- Install Signal on Desktop Start ---
# Command 1
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
# Command 2
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
# Command 3
sudo apt update && sudo apt install signal-desktop
# --- Install Signal on Desktop End ---
# --- Install LibreWolf on Desktop Start ---

# --- Install LibreWolf on Desktop End ---


# ------------------------------------------------------------------------
general_Packages="exfat-utils gcc git 
                  htop nodejs ntfs-3g p7zip php python tailscale timeshift tmux 
                  gvim nvidia nvidia-settings nvidia-utils"
general_Aur_Packages="backintime librewolf-bin nordvpn-bin"
desktop_Packages="audacity cups 
                  freecad hplip 
                  obs-studio veracrypt"
desktop_Aur_Packages="drawio minecraft-launcher qflipper"




------------------------- FREEBSD SETUP -------------------------

echo "SCRIPT START"

read -p "What is your username: " username
echo "Alight $username, lets do this..."

read -sp "Enter your password: " user_password
echo

packages="curl bash qtcreator vim libreoffice kmymoney gnucash"
# the -y flag to pkg install automatically confirms the installation
pkg install -y $packages
sysrc kld_list+=linux
sysrc kld_list+=linux64


# --- general ---
pkg update && pkg upgrade
pkg install vim
# --- kernel update ---
# --- xorg setup ---
pkg install xorg
# --- intel graphics ---
pkg install drm-kmod
pkg install nvidia-driver
pkg install cinnamon
pkg install lightdm lightdm-gtk-greeter

