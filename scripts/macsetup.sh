#!/bin/bash


# Brew Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Brew GUI Packages
brew install --cask \
audacity bitwarden visual-studio-code dolphin drawio firefox freecad gimp \
github handbrake libreoffice samsung-magician minecraft mos nordvpn obs qbittorrent \
signal thunderbird veracrypt vlc wireshark zoom microsoft-office \
yubico-authenticator


# Brew CLI Packages
brew install \
python@3.13


echo "With installer: pcsx2, yt-dlg, kiwix, librewolf"
echo "Finished! Installation Complete!"

