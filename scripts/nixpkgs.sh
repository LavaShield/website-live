#!/bin/bash

# Check if Nix is installed
read -p "Do you already have Nix installed? (y/n): " has_nix
if [[ "$has_nix" != "y" ]]; then
  echo "Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install) --daemon
  echo "Nix installed successfully. Please restart your terminal session to ensure Nix is initialized."
  exit 0
fi

# Pkgs List
raw_pkgs="audacity backintime bitwarden-desktop cemu dolphin-emu drawio firefox flameshot freecad gimp \
github-desktop gzdoom kdePackages.kdenlive librewolf libreoffice minecraft neofetch obs-studio opensnitch \
pcsx2 python313 qbittorrent rpcs3 ryujinx session-desktop signal-desktop simple64 steam-unwrapped thunderbird \
timeshift ungoogled-chromium veracrypt vlc vscode yt-dlg"

# Prepend nixpkgs. in front of all packages
pkgs=$(echo "$raw_pkgs" | tr ' ' '\n' | sort | sed 's/^/nixpkgs./' | tr '\n' ' ')

# Install Pkgs
echo "Installing packages..."
nix-env -iA $pkgs

# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"
