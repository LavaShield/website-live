#!/bin/bash

desktop_apt_packages=""
desktop_snap_packages=""
server_apt_packages=""
server_snap_packages="docker"



# ------------------------------------------------------------------------
general_Packages="curl dosfstools exfat-utils gcc git 
                  htop nodejs ntfs-3g p7zip php python tailscale timeshift tmux 
                  gvim nvidia nvidia-settings nvidia-utils"
general_Aur_Packages="backintime librewolf-bin nordvpn-bin"
desktop_Packages="audacity bitwarden bluez bluez-utils code cups 
                  filezilla flameshot freecad gimp hplip 
                  libreoffice-fresh neofetch obs-studio
                  qbittorrent signal-desktop sqlitebrowser steam
                  system-config-printer thunderbird veracrypt vlc wireshark-qt"
desktop_Aur_Packages="drawio minecraft-launcher qflipper"
