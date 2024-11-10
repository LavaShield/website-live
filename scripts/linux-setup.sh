# Install Nix (Multi-User)
sh <(curl -L https://nixos.org/nix/install) --daemon

# Packages to installed via nix
nix-env -iA nixpkgs.qFlipper


        "base-devel gcc gdb git htop jdk21-openjdk "
        "man-db man-pages nodejs npm ntfs-3g openjdk21-doc openjdk21-src p7zip python "
        gvim

    "aur_general_packages": "backintime librewolf-bin",


    "desktop_packages": (
        "audacity  cups filezilla flameshot gimp "
        "libreoffice-fresh neofetch obs-studio opensnitch qbittorrent signal-desktop "
        "sqlitebrowser vlc wireshark-qt "
        "virtualbox"
        "kdenlive"
    ),

    "desktop_services": "opensnitchd",


    
        

# Additional packages are Bitwarden, vscode, nordvpn, steam, thunderbird and veracrypt. These have been installed already via .deb

# Add flameshot, backintime, and timeshift to startup
