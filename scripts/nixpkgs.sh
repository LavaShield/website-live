
# Install Nix (Globally)
sh <(curl -L https://nixos.org/nix/install) --daemon

# Pkgs List
raw_pkgs = "librewolf audacity python313 backintime veracrypt bitwarden-desktop vim qbittorrent gzdoom cemu pcsx2 \
minecraft rpcs3 gimp dolphin-emu vlc github-desktop opensnitch flameshot timeshift freecad"

# Prepend nixpkgs. in front of all packages

# Install Pkgs


# Goodbye Message
echo "Remember to add flameshot, backintime, and timeshift to startup"
