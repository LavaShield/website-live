#!/bin/bash
# Preference: 1-Apt, 2-Flatpak

# Apt Packages


# Flatpak (Flathub) Packages




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
audacity backintime-qt bitwarden cemu, chromium code curl dolphin-emu drawio firefox flameshot freecad gimp gitkraken gzdoom, install kdenlive kiwix libreoffice minecraft, neofetch nordvpn obs-studio opensnitch pcsx2 python3.13 qbittorrent rpcs3, ryujinx, session, simple64, snap steam sudo thunderbird timeshift veracrypt, vim vlc yt-dlg
