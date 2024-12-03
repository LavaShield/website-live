#!/bin/bash

# Nix Packages
PACKAGES="librewolf"

# Install Packages
nix-env -iA $(echo $PACKAGES | sed 's/\b/nixos./g')
