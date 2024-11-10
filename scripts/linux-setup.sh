# Install Nix (Multi-User)
sh <(curl -L https://nixos.org/nix/install) --daemon




        "base-devel curl dosfstools exfat-utils gcc gdb git htop jdk21-openjdk "
        "man-db man-pages nodejs npm ntfs-3g openjdk21-doc openjdk21-src p7zip python "
        "rsync timeshift tmux gvim pipewire pipewire-pulse pipewire-alsa reflector "
        "vulkan-icd-loader vulkan-tools vulkan-validation-layers lib32-vulkan-icd-loader "
        "lib32-libglvnd mesa lib32-mesa gnome gnome-extra cinnamon"

    "aur_general_packages": "backintime librewolf-bin nordvpn-bin",


    "desktop_packages": (
        "audacity bitwarden bluez bluez-utils code cups filezilla flameshot gimp "
        "libreoffice-fresh neofetch obs-studio opensnitch qbittorrent signal-desktop "
        "sqlitebrowser system-config-printer thunderbird veracrypt vlc wireshark-qt "
        "redshift pipewire-jack easyeffects virtualbox virtualbox-host-modules-arch"
        "kdenlive"
    ),
    "aur_desktop_packages": "qflipper-bin davinci-resolve session-desktop-bin",
    "desktop_services": "opensnitchd",


    
        

# Additional packages are Bitwarden, vscode, nordvpn, steam and veracrypt. These have been installed already via .deb

# Add flameshot, backintime, and timeshift to startup
