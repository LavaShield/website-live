#!/bin/bash

# Add repositories for Focal, Oracular, and Plucky
echo "Adding Focal, Oracular, and Plucky repositories..."
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
echo "To install a package from a specific release, use the following syntax:"
echo "sudo apt install -t <release> <package-name>"
echo "Example: sudo apt install -t focal vim"
echo "Done!"



# Packages installed with apt
sudo apt install \
android-file-transfer audacity backintime-common blender chromium-browser cmake curl dasher \
dolphin-emu filezilla firefox flameshot freecad gcc gdb gimp git golang htop kdenlive \
libreoffice love lua5.4 luajit luarocks man-db manpages neofetch neovim nodejs obs-studio \
openjdk-21-doc openjdk-21-jdk openjdk-21-source opensnitch p7zip pcsx2 php8.3 python3.13 \
qbittorrent qflipper rsync ruby sqlitebrowser steam thunderbird timeshift tmux vim \
vim-gui-common virtualbox vlc wireshark youtubedl-gui
# Maybe need nvidia nvidiasettings nvidiautils

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

# Final Notes
echo "Make sure to add flameshot, backintime, and timeshift to startup"

# Installed via .deb: android-studio, bitwarden, clion, crossover, davinci-resolve, drawio, 
# github-desktop, gog-galaxy, gzdoom, iina, intellij, minecraft, nordvpn, numi, pycharm,
# samsung-magician, session, veracrypt, vscode, webstorm, zoom
