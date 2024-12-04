#!/bin/bash

# Nix Packages
PACKAGES="librewolf android-file-transfer android-studio rpcs3 audacity backintime bitwarden-desktop blender cemu \
ungoogled-chromium jetbrains.clion cmake vscode dasher davinci-resolve zoom-us nodejs_22 opensnitch signal-desktop \
steam gzdoom vim neovim dolphin-emu session-desktop sqlitebrowser drawio filezilla firefox flameshot freecad \
jetbrains.webstorm jetbrains.pycharm-community jetbrains.phpstorm thunderbird php84 python313 pcsx2 qflipper \
gcc gdb gimp git libreoffice yt-dlg wireshark vlc veracrypt timeshift tmux virtualbox ruby qbittorrent lua luajit \


"

# Other Packages: luarocks


# Install Packages
nix-env -iA $(echo $PACKAGES | sed 's/\b/nixos./g')

echo "Remember To Add Backintime, Flameshot, And Timeshift To Startup!"
