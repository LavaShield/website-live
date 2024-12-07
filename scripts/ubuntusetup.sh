#!/bin/bash








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









# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"
# -------------------------------------------------------------------------



# Pkgs List
raw_pkgs="audacity cemu dolphin-emu drawio flameshot freecad gimp github-desktop gzdoom \
kdePackages.kdenlive libreoffice minecraft neofetch obs-studio pcsx2 python313 qbittorrent rpcs3 \
ryujinx session-desktop simple64 ungoogled-chromium veracrypt vlc vscode yt-dlg vim"

# Prepend nixpkgs. in front of all packages and sort alphabetically
pkgs=$(echo "$raw_pkgs" | tr ' ' '\n' | sort | sed 's/^/nixpkgs./' | tr '\n' ' ')

# Install Pkgs
echo "Installing packages..."
nix-env -iA $pkgs

# Other Packages
echo "Installing other packages..."
sudo apt install backintime-qt timeshift steam firefox thunderbird kiwix opensnitch
sudo snap install bitwarden nordvpn



# Enable Services
sudo systemctl start --now opensnitch.service
sudo systemctl enable --now opensnitch.service

