import os
import subprocess
import sys

# Package Groups
general_packages = [
    "base-devel", "cinnamon", "curl", "dosfstools", "exfat-utils", "gcc", "git", "gnome",
    "gnome-extra", "htop", "jdk21-openjdk", "man-db", "man-pages", "nodejs", "ntfs-3g",
    "openjdk21-doc", "openjdk21-src", "p7zip", "python", "timeshift", "tmux", "gvim",
    "nvidia", "nvidia-settings", "nvidia-utils"
]
general_aur_packages = ["backintime", "librewolf-bin", "nordvpn-bin"]
desktop_packages = [
    "audacity", "bitwarden", "bluez", "bluez-utils", "code", "cups",
    "filezilla", "flameshot", "gimp", "libreoffice-fresh", "neofetch", "obs-studio",
    "opensnitch", "qbittorrent", "signal-desktop", "sqlitebrowser",
    "system-config-printer", "thunderbird", "veracrypt", "vlc", "wireshark-qt"
]
desktop_aur_packages = ["qflipper-bin"]  # brother-hll2460dw
server_packages = ["docker", "docker-compose", "openssh", "ufw"]

# Function to print text in bright blue
def print_blue(text):
    print(f"\033[1;34m{text}\033[0m")

# Function to install Arch Linux packages
def install_packages(name, packages):
    print_blue(f"Installing {name} Official Arch Packages")
    subprocess.run(["sudo", "pacman", "-Syu"] + packages)
    print_blue(f"{name} Official Arch Packages Installed")

# Function to install AUR packages using yay
def install_aur_packages(name, packages):
    print_blue(f"Installing {name} AUR Packages")
    subprocess.run(["yay", "-S"] + packages)
    print_blue(f"{name} AUR Packages Installed")

def general():
    # Remove Bloat
    print_blue("Removing Bloat")
    subprocess.run(["sudo", "pacman", "-Rsu", "welcome"])
    print_blue("Bloat Removed")

    # Install General Packages
    install_packages("General", general_packages)

    # Installing Yay
    print_blue("Installing Yay")
    os.chdir(os.path.expanduser("~/Downloads"))
    subprocess.run(["git", "clone", "https://aur.archlinux.org/yay.git"])
    os.chdir("yay")
    subprocess.run(["makepkg", "-si", "--noconfirm"], input=b'y\n')
    os.chdir("..")
    subprocess.run(["sudo", "rm", "-rf", "yay"])
    print_blue("Yay Installed")

    # Install General AUR Packages
    install_aur_packages("General", general_aur_packages)

    # Tailscale General Setup
    subprocess.run(["sudo", "systemctl", "enable", "--now", "tailscaled"])
    subprocess.run(["sudo", "tailscale", "up"])
    subprocess.run(["sudo", "tailscale", "ip", "-4"])

    # Add copy-paste to gvim
    with open(os.path.expanduser("~/.vimrc"), "a") as vimrc:
        vimrc.write("set clipboard=unnamedplus\n")

# Function to setup server environment
def setup_server():
    # Install Server Packages
    install_packages("Server", server_packages)

    # Install Server AUR Packages
    install_aur_packages("Server", [])  # No server AUR packages provided

    # Server System services, starting and enabling them
    print_blue("Starting And Enabling Server System Services")
    subprocess.run(["sudo", "systemctl", "start", "sshd"])
    subprocess.run(["sudo", "systemctl", "enable", "sshd"])
    subprocess.run(["sudo", "systemctl", "enable", "docker"])
    subprocess.run(["sudo", "systemctl", "start", "docker"])
    print_blue("Server System Service Started And Enabled")

    # Allow SSH connections
    print_blue("Allowing SSH Connections")
    subprocess.run(["sudo", "ufw", "allow", "ssh"])
    subprocess.run(["sudo", "ufw", "enable"])
    print_blue("SSH Connections Allowed")

# Function to setup desktop environment
def setup_desktop():
    # Install Desktop Packages
    install_packages("Desktop", desktop_packages)

    # Install Desktop AUR Packages
    install_aur_packages("Desktop", desktop_aur_packages)

    # Desktop System services, starting and enabling them
    print_blue("Starting And Enabling Desktop System Services")
    subprocess.run(["sudo", "systemctl", "enable", "bluetooth.service"])
    subprocess.run(["sudo", "systemctl", "start", "bluetooth.service"])
    subprocess.run(["sudo", "systemctl", "enable", "cups.service"])
    subprocess.run(["sudo", "systemctl", "start", "cups.service"])
    subprocess.run(["sudo", "systemctl", "enable", "--now", "opensnitchd"])
    subprocess.run(["sudo", "systemctl", "start", "opensnitchd"])
    print_blue("Desktop System Service Started And Enabled")

# ------Main script starts here------
def main():
    subprocess.run(["sudo", "echo", "Welcome to the ArchLinux setup script!"])
    setup_choice = input("What would you like to setup?\n1. Server setup\n2. Desktop setup\nEnter your choice (1/2): ")

    # Run the general setup
    general()

    if setup_choice == "1":
        setup_server()
    elif setup_choice == "2":
        setup_desktop()
    else:
        print("Invalid choice. Please choose either 1 or 2.")
        sys.exit(1)

    # Conclusion message
    print_blue("Setup Finished ;)")
    print_blue("Now for tailscale, go to /usr/lib/sysctl.d/50-default.conf and then make sure these conditions "
               "are set in the config file: \"net.ipv4.conf.default.rp_filter = 1\", "
               "\"net.ipv4.conf.all.rp_filter = 1\" (here for more details, https://tailscale.com/download/linux/arch)")
    print_blue("Additionally, go to vim and then execute this command ':set clipboard=unnamedplus'")
    print_blue("Now just add flameshot, back in time, and timeshift to startup. Maybe a theme???")

if __name__ == "__main__":
    main()
