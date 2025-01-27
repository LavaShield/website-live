#!/bin/bash


# Brew Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Brew GUI Packages
brew install --cask \
audacity bitwarden chromium visual-studio-code crossover dolphin drawio firefox flameshot freecad gimp \
github handbrake libreoffice samsung-magician minecraft mos nordvpn obs qbittorrent \
signal thunderbird veracrypt vlc wireshark zoom microsoft-office librewolf yubico-yubikey-manager \
yubico-authenticator


# Brew CLI Packages
brew install \
node@22 python@3.13 vim


echo "With installer: pcsx2, yt-dlg, kiwix"
echo "Finished! Installation Complete!"
