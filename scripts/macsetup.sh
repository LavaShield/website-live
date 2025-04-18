#!/bin/bash


# Brew Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Brew GUI Packages
brew install --cask \
audacity visual-studio-code dolphin drawio firefox freecad gimp \
github handbrake libreoffice samsung-magician mos nordvpn obs qbittorrent \
vlc wireshark zoom microsoft-office avogadro roblox \
yubico-authenticator macos-fuse-t/homebrew-cask/fuse-t kdenlive blender \
intellij-idea-ce wine-stable whisky


# Brew CLI Packages
brew install \
python@3.13 yt-dlp ffmpeg python-tk openjdk


echo "With installer: pcsx2, yt-dlg, kiwix, librewolf, veracrypt (fuse-t), signal, bitwarden"
echo "Finished! Installation Complete!"

