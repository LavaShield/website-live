#!/bin/bash

# Packages installed with apt
sudo apt install \
android-file-transfer audacity backintime-common blender chromium-browser cmake curl dasher \
dolphin-emu filezilla firefox flameshot freecad gcc gdb gimp git golang htop kdenlive \
libreoffice love lua5.4 luajit luarocks man-db manpages neofetch neovim nodejs obs-studio \
openjdk-21-doc openjdk-21-jdk openjdk-21-source opensnitch p7zip pcsx2 php8.3 python3.13 \
qbittorrent qflipper rsync ruby sqlitebrowser steam thunderbird timeshift tmux vim \
vim-gui-common virtualbox vlc wireshark youtubedl-gui
# Maybe need nvidia nvidiasettings nvidiautils

# Packages installed with snap
sudo apt update
sudo apt install snapd
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
