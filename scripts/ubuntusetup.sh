#!/bin/bash
general_apt_packages=""
general_snap_packages=""

server_apt_packages=""
server_snap_packages="docker"

desktop_apt_packages="wireshark gimp vlc qbittorrent filezilla flameshot curl"
desktop_snap_packages="steam thunderbird code bitwarden"
# --- Install Signal on Desktop Start ---
# Command 1
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
# Command 2
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
# Command 3
sudo apt update && sudo apt install signal-desktop
# --- Install Signal on Desktop End ---
# --- Install LibreWolf on Desktop Start ---

# --- Install LibreWolf on Desktop End ---


# ------------------------------------------------------------------------
general_Packages="exfat-utils gcc git 
                  htop nodejs ntfs-3g p7zip php python tailscale timeshift tmux 
                  gvim nvidia nvidia-settings nvidia-utils"
general_Aur_Packages="backintime librewolf-bin nordvpn-bin"
desktop_Packages="audacity cups 
                  freecad hplip 
                  obs-studio veracrypt"
desktop_Aur_Packages="drawio minecraft-launcher qflipper"
