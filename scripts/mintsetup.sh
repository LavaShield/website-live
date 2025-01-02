#!/bin/bash

# Preference: 1 - Apt, 2 - Flatpak, 3 - .deb

# Apt Packages
sudo apt install \
audacity backintime-qt firefox flameshot freecad gimp kdenlive kiwix libreoffice obs-studio opensnitch \
python3.13 qbittorrent thunderbird timeshift vim vlc git gcc dotnet-sdk-8.0

# Flatpak (Flathub) Packages
flatpak install flathub \
com.bitwarden.desktop io.github.ungoogled_software.ungoogled_chromium com.visualstudio.code-oss \
com.jgraph.drawio.desktop com.mojang.Minecraft net.pcsx2.PCSX2 fr.handbrake.ghb org.DolphinEmu.dolphin-emu \

# NordVPN Install
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

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
echo "Install Veracrypt and yt-dlg with local deb file and remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"
