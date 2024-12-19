import os
import subprocess
import sys

# Configuration Block - Centralized for easy customization
CONFIG = {
    # General packages for all setups
    "general_packages": (
        "base-devel curl dosfstools exfat-utils gcc gdb git htop jdk21-openjdk luajit luarocks curl pycharm-community-edition "
        "man-db man-pages nodejs npm ntfs-3g openjdk21-doc openjdk21-src p7zip python lua go gdb cmake intellij-idea-community-edition "
        "rsync timeshift tmux gvim pipewire pipewire-pulse pipewire-alsa reflector php love dasher "
        "vulkan-icd-loader vulkan-tools vulkan-validation-layers lib32-vulkan-icd-loader neovim p7zip "
        "lib32-libglvnd mesa lib32-mesa gnome gnome-extra cinnamon blender chromium firefox drawio-desktop ruby "
    ),
    "aur_general_packages": "backintime librewolf-bin nordvpn-bin zoom webstorm",

    # Desktop-specific packages
    "desktop_packages": (
        "audacity bitwarden bluez bluez-utils code cups filezilla flameshot gimp freecad "
        "libreoffice-fresh neofetch obs-studio opensnitch qbittorrent signal-desktop "
        "sqlitebrowser system-config-printer thunderbird veracrypt vlc wireshark-qt "
        "redshift pipewire-jack easyeffects virtualbox virtualbox-host-modules-arch "
        "kdenlive steam android-file-transfer dolphin-emu "
    ),
    "aur_desktop_packages": "qflipper-bin davinci-resolve session-desktop-bin yt-dlg-git pcsx2-latest-bin android-studio clion crossover github-desktop-bin gzdoom minecraft-launcher ",
    "desktop_services": "bluetooth.service cups.service opensnitchd",

    # Server-specific packages
    "server_packages": "docker docker-compose openssh ufw",
    "server_services": "sshd docker ufw",

    # GPU drivers and graphics stack
    "nvidia_dedicated_gpu_packages": (
        "nvidia nvidia-settings nvidia-utils lib32-nvidia-utils"
    ),
    "amd_dedicated_gpu_packages": (
        "xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon mesa-vdpau "
        "lib32-mesa-vdpau opencl-mesa"
    ),
    "intel_integrated_gpu_packages": (
        "intel-media-driver vulkan-intel lib32-vulkan-intel"
    ),
    "amd_integrated_gpu_packages": (
        "vulkan-radeon lib32-vulkan-radeon mesa-vdpau lib32-mesa-vdpau"
    ),

    # CPU microcode
    "amd_cpu_microcode": "amd-ucode",
    "intel_cpu_microcode": "intel-ucode",

    # Logging
    "log_file": "/var/log/arch_setup.log",

    # Shit to remove
    "bloat_packages": "welcome"
}

# Utility Functions
def print_blue(text):
    """Prints text in blue for emphasis."""
    print(f"\033[1;34m{text}\033[0m")

def run_command(command, description, fail_message, exit_on_fail=True):
    """Executes a shell command, logs success or failure, and optionally exits on failure."""
    try:
        subprocess.run(command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print_blue(f"{fail_message}\nError: {e}")
        if exit_on_fail:
            sys.exit(1)

def install_packages(name, package_list):
    """Installs the specified list of packages using pacman."""
    print_blue(f"Installing {name} packages...")
    run_command(f"sudo pacman -Sy {package_list}", 
                f"Installed {name} packages", f"Failed to install {name} packages")

def install_aur_packages(name, package_list):
    """Installs the specified list of AUR packages using yay."""
    print_blue(f"Installing {name} AUR packages...")
    run_command(f"yay -S {package_list}", 
                f"Installed {name} AUR packages", f"Failed to install {name} AUR packages")

def manage_services(services):
    """Enables and starts the specified systemd services."""
    for service in services.split():
        if service:
            print_blue(f"Enabling and starting {service} service...")
            run_command(f"sudo systemctl enable --now {service}", 
                        f"Enabled {service}", f"Failed to enable {service}", exit_on_fail=False)
            run_command(f"sudo systemctl start {service}", 
                        f"Started {service}", f"Failed to start {service}", exit_on_fail=False)

# Pre-Checks
def pre_checks():
    # """Ensures the script is run as root and installs yay if not present."""
    # if os.geteuid() != 0:
    #     print("This script must be run as root!")
    #     sys.exit(1)
    
    if subprocess.call("command -v yay", shell=True) != 0:
        print_blue("Installing Yay AUR helper...")
        run_command(
            "git clone https://aur.archlinux.org/yay.git ~/Downloads/yay && cd ~/Downloads/yay && makepkg -si --noconfirm && sudo rm -rf ~/Downloads/yay",
            "Installed Yay",
            "Failed to install Yay"
        )

# GPU Setup
def setup_gpu():
    gpu_choice = get_valid_input("Do you have a discrete (dedicated) GPU? (yes/no): ", ["yes", "no"])
    if gpu_choice == "yes":
        gpu_brand = get_valid_input("Which brand is your discrete GPU? (nvidia/amd): ", ["nvidia", "amd"])
        if gpu_brand == "nvidia":
            install_packages("NVIDIA GPU Drivers", CONFIG["nvidia_dedicated_gpu_packages"])
        else:
            install_packages("AMD GPU Drivers", CONFIG["amd_dedicated_gpu_packages"])
    elif get_valid_input("Do you have integrated graphics in your CPU? (yes/no): ", ["yes", "no"]) == "yes":
        cpu_brand = get_valid_input("Which brand is your CPU with integrated graphics? (intel/amd): ", ["intel", "amd"])
        if cpu_brand == "intel":
            install_packages("Intel Integrated Graphics Drivers", CONFIG["intel_integrated_gpu_packages"])
        else:
            install_packages("AMD Integrated Graphics Drivers", CONFIG["amd_integrated_gpu_packages"])

# CPU Setup
def setup_cpu():
    cpu_brand = get_valid_input("Which brand is your CPU? (amd/intel): ", ["amd", "intel"])
    install_packages(f"{cpu_brand.upper()} CPU Microcode", CONFIG[f"{cpu_brand}_cpu_microcode"])

# General Setup
def general_setup():
    setup_gpu()
    setup_cpu()
    print_blue("Installing General Packages...")
    install_packages("General", CONFIG["general_packages"])
    install_aur_packages("AUR General", CONFIG["aur_general_packages"])

# Server Setup
def setup_server():
    install_packages("Server", CONFIG["server_packages"])
    manage_services(CONFIG["server_services"])
    run_command("sudo ufw allow ssh && sudo ufw enable", 
                "Configured firewall", "Failed to configure firewall")

# Desktop Setup
def setup_desktop():
    install_packages("Desktop", CONFIG["desktop_packages"])
    install_aur_packages("AUR Desktop", CONFIG["aur_desktop_packages"])
    manage_services(CONFIG["desktop_services"])

# Input Validation
def get_valid_input(prompt, valid_choices, error_message="Invalid choice."):
    """Gets valid input from user with re-prompting until a valid choice is made."""
    while True:
        choice = input(prompt).strip().lower()
        if choice in valid_choices:
            return choice
        else:
            print_blue(f"{error_message} Please enter one of: {', '.join(valid_choices)}")

# Main Function
def main():
    """Main entry point for the script."""
    pre_checks()
    print_blue("Welcome to the Arch Linux setup script!")
    setup_choice = get_valid_input("What would you like to set up?\n1. Server\n2. Desktop\nEnter your choice (1/2): ", ["1", "2"])
    
    general_setup()
    
    if setup_choice == "1":
        setup_server()
    elif setup_choice == "2":
        setup_desktop()

    # print_blue("Removing Bloat")
    # run_command(f"sudo pacman -Rs {CONFIG["bloat_packages"]}", "Removing Bloat", "Failed To Remove Bloat")
    # print_blue("Bloat Removed")

    print_blue("Enabling Clipboard For Vim")
    with open(os.path.expanduser("~/.vimrc"), "a") as vimrc:
        vimrc.write("set clipboard=unnamedplus\n")
    print_blue("Vim Clipboard Enabled")
    
    print_blue("Setup finished! Additionally don't forget to add flameshot, back in time, and timeshift to startup.")

if __name__ == "__main__":
    main()
