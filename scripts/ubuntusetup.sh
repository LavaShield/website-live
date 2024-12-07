#!/bin/bash

# Snap Packages
sudo snap install \


# Apt Packages
sudo apt install \


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
vlc steam firefox thunderbird bitwarden nordvpn drawio freecad gimp gitkraken kdenlive libreoffice \
chromium code
audacity timeshift backintime-qt kiwix opensnitch dolphin-emu flameshot neofetch obs-studio pcsx2 \
python3.13 qbittorrent vim
# cemu, gzdoom, minecraft, rpcs3, ryujinx, sessiondesktop, simple64, veracrypt, youtube-dlg
