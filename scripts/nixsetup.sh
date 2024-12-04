#!/bin/bash

# Allow Unfree
export NIXPKGS_ALLOW_UNFREE=1

# Nix Package List
UNFILTERED_PACKAGES="android-file-transfer android-studio audacity backintime bitwarden-desktop blender cemu cmake dasher \
davinci-resolve dolphin-emu drawio filezilla firefox flameshot freecad gcc gdb gimp git github-desktop gzdoom \
jetbrains.clion jetbrains.idea-community jetbrains.phpstorm jetbrains.pycharm-community jetbrains.webstorm jdk \
kdePackages.kdenlive libreoffice librewolf love lua luajit minecraft neofetch nodejs_22 obs-studio \
opensnitch pcsx2 php84 python313 qbittorrent qflipper rpcs3 rsync session-desktop signal-desktop simple64 \
sqlitebrowser steam thunderbird timeshift tmux ungoogled-chromium veracrypt vim virtualbox vlc vscode wireshark \
yt-dlg zoom-us go"
# Other Packages: luarocks, samsung-magician, nordvpn, nvidia, jdk21-src, jdk21-doc

# Nix Package List Named Properly
FILTERED_PACKAGES=$(echo "$UNFILTERED_PACKAGES" | sed 's/\b\([^ ]*\)/nixos.\1/g')

# Prepend "nixos." to each package and install in one command.
nix-env -iA $FILTERED_PACKAGES

echo "Remember To Add Backintime, Flameshot, And Timeshift To Startup!"
