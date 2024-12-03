#!/bin/bash

# Add Repos Of Other Ubuntu Versions, Focal, Oracular, and Plucky
# Define repository components
COMPONENTS="main universe restricted multiverse"
# Backup existing sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
# Add Focal, Oracular, and Plucky repositories
{
  echo "# Focal (20.04)"
  for component in $COMPONENTS; do
    echo "deb http://archive.ubuntu.com/ubuntu focal $component"
    echo "deb http://archive.ubuntu.com/ubuntu focal-updates $component"
    echo "deb http://archive.ubuntu.com/ubuntu focal-security $component"
  done
  echo "# Oracular"
  for component in $COMPONENTS; do
    echo "deb http://archive.ubuntu.com/ubuntu oracular $component"
    echo "deb http://archive.ubuntu.com/ubuntu oracular-updates $component"
    echo "deb http://archive.ubuntu.com/ubuntu oracular-security $component"
  done
  echo "# Plucky"
  for component in $COMPONENTS; do
    echo "deb http://archive.ubuntu.com/ubuntu plucky $component"
    echo "deb http://archive.ubuntu.com/ubuntu plucky-updates $component"
    echo "deb http://archive.ubuntu.com/ubuntu plucky-security $component"
  done
} | sudo tee -a /etc/apt/sources.list
# Update package lists
echo "Updating package lists..."
sudo apt update
# Install a package from a specific release (optional example)
# echo "To install a package from a specific release, use the following syntax:"
# echo "sudo apt install -t <release> <package-name>"
# echo "Example: sudo apt install -t focal vim"


# Enable Snap :(
sudo rm /etc/apt/preferences.d/nosnap.pref
apt update
apt install snapd

# Apt Packages
sudo apt install \
android-file-transfer audacity backintime-qt blender chromium-browser cmake curl dasher \
filezilla firefox flameshot gcc gdb gimp git golang htop kdenlive dolphin-emu python3.13 \
libreoffice love lua5.4 luajit luarocks man-db manpages neofetch neovim nodejs obs-studio \
openjdk-21-doc openjdk-21-jdk openjdk-21-source opensnitch p7zip pcsx2 php8.3 \
qbittorrent qflipper rsync ruby sqlitebrowser steam thunderbird timeshift tmux vim \
vim-gui-common virtualbox vlc wireshark youtubedl-gui dotnet-sdk-9.0 freecad

# Snap Packages
# Regular Packages
sudo snap install bitwarden drawio session-desktop nordvpn
# Classic Packages
classicPkgs="android-studio clion code pycharm-community webstorm intellij-idea-community "
for pkg in $classicPkgs; do
  sudo snap install "$pkg" --classic
done



# Install LibreWolf
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# Install Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Enable Services
sudo systemctl start --now opensnitch.service
sudo systemctl enable --now opensnitch.service

# Install Local Debs
for file in ~/.lavashield/pkgs/u/*.deb; do sudo dpkg -i "$file"; done

# Final Notes
echo "Make sure to add flameshot, backintime, and timeshift to startup"

# Installed via .deb: gzdoom, minecraft, veracrypt, zoom
# Installed via .AppImage: session, rpcs3, cemu, 
