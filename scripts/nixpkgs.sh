#!/bin/bash

# Check if Nix is installed
if ! command -v nix-env &> /dev/null; then
  echo "Nix is not installed or not properly configured. Please install Nix manually first."
  echo "You can install Nix using the following command:"
  echo "sh <(curl -L https://nixos.org/nix/install) --daemon"
  exit 1
fi

# Temporarily Allow Unfree Packages
export NIXPKGS_ALLOW_UNFREE=1

# Pkgs List
raw_pkgs="audacity bitwarden-desktop cemu dolphin-emu drawio firefox flameshot freecad gimp github-desktop gzdoom \
kdePackages.kdenlive librewolf libreoffice minecraft neofetch obs-studio opensnitch pcsx2 python313 qbittorrent rpcs3 \
ryujinx session-desktop simple64 thunderbird ungoogled-chromium veracrypt vlc vscode yt-dlg vim"

# Prepend nixpkgs. in front of all packages and sort alphabetically
pkgs=$(echo "$raw_pkgs" | tr ' ' '\n' | sort | sed 's/^/nixpkgs./' | tr '\n' ' ')

# Install Pkgs
echo "Installing packages..."
nix-env -iA $pkgs

# Other Packages
echo "Installing other packages..."
sudo apt install backintime-qt timeshift steam

# Installing Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"
