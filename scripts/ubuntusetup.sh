#!/bin/bash

# Snap Packages
sudo snap install \
bitwarden chromium drawio firefox freecad gitkraken kdenlive libreoffice nordvpn steam thunderbird \
vlc 

# Snap Classic Packages
sudo snap install code --classic

# Apt Packages
sudo apt install \
audacity backintime-qt curl dolphin-emu flameshot gimp kiwix neofetch obs-studio opensnitch pcsx2 python3.13 \
qbittorrent timeshift vim

# Signal Install
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Librewolf Install
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# Enable Services
# sudo systemctl start --now opensnitch.service
# sudo systemctl enable --now opensnitch.service

# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"

# ------------------------------------------------------
# Installed with .deb or N/A: cemu, gzdoom, minecraft, rpcs3, ryujinx, session, simple64, veracrypt, yt-dlg
