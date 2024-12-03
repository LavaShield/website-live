#!/bin/bash

# Nix Packages
PACKAGES="librewolf android-file-transfer android-studio rpcs3 audacity backintime bitwarden-desktop blender cemu \
ungoogled-chromium jetbrains.clion cmake vscode dasher davinci-resolve zoom-us "

# Install Packages
nix-env -iA $(echo $PACKAGES | sed 's/\b/nixos./g')

echo "Remember To Add Backintime, Flameshot, And Timeshift To Startup!"
