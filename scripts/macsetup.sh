#!/bin/bash


# Brew Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Brew Packages
brew install \















# =======================================================================================================

#!/bin/bash
# Preference: 1 - Apt, 2 - Flatpak, 3 - .deb


# Apt Packages
sudo apt install \
audacity backintime-qt dolphin-emu firefox flameshot freecad gimp kdenlive kiwix libreoffice obs-studio opensnitch \
python3.13 qbittorrent thunderbird timeshift vim vlc git

# Flatpak (Flathub) Packages
flatpak install flathub \
com.bitwarden.desktop io.github.ungoogled_software.ungoogled_chromium com.visualstudio.code-oss \
com.jgraph.drawio.desktop com.mojang.Minecraft net.pcsx2.PCSX2 fr.handbrake.ghb

# NordVPN Install
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

# Signal Install
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Librewolf Install
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# Enable Services
# sudo systemctl start --now opensnitch.service
# sudo systemctl enable --now opensnitch.service

# Goodbye Message
echo "Install Veracrypt and yt-dlg with local deb file and remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"

#!/bin/bash
# Preference: 1 - Apt, 2 - Flatpak, 3 - .deb

# Apt Packages
sudo apt install \
audacity backintime-qt dolphin-emu firefox flameshot freecad gimp kdenlive kiwix libreoffice obs-studio opensnitch \
python3.13 qbittorrent thunderbird timeshift vim vlc openjdk-21-jdk

# Flatpak (Flathub) Packages
flatpak install flathub \
com.bitwarden.desktop info.cemu.Cemu io.github.ungoogled_software.ungoogled_chromium com.visualstudio.code-oss \
com.jgraph.drawio.desktop io.github.shiftey.Desktop org.zdoom.GZDoom com.mojang.Minecraft net.rpcs3.RPCS3 \
org.ryujinx.Ryujinx network.loki.Session io.github.simple64.simple64 net.pcsx2.PCSX2 fr.handbrake.ghb

# NordVPN Install
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

# Signal Install
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Librewolf Install
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# Enable Services
# sudo systemctl start --now opensnitch.service
# sudo systemctl enable --now opensnitch.service

# Goodbye Message
echo "Install Veracrypt and yt-dlg with local deb file and remember to add flameshot, backintime, and timeshift to startup."
echo "Installation complete!"



#!/bin/bash # preference: 1 - apt, 2 flatpak, 3 .deb apt packages sudo apt install \ audacity backintime-qt dolphin-emu firefox flameshot freecad gimp kdenlive kiwix libreoffice obs-studio opensnitch python3.13 qbittorrent thunderbird timeshift vim vlc openjdk-21-jdk nodejs git flatpak (flathub) flatpak flathub com.bitwarden.desktop info.cemu.cemu io.github.ungoogled_software.ungoogled_chromium com.visualstudio.code-oss com.jgraph.drawio.desktop io.github.shiftey.desktop org.zdoom.gzdoom com.mojang.minecraft net.rpcs3.rpcs3 org.ryujinx.ryujinx network.loki.session io.github.simple64.simple64 net.pcsx2.pcsx2 fr.handbrake.ghb nordvpn install sh <(curl -ssf https://downloads.nordcdn.com/apps/linux/install.sh) signal wget -o- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg cat tee /usr/share/keyrings/signal-desktop-keyring.gpg /dev/null echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\ /etc/apt/sources.list.d/signal-xenial.list update && signal-desktop librewolf extrepo -y enable librewolf enable services systemctl start --now opensnitch.service goodbye message "install veracrypt and yt-dlg with local deb file remember to add flameshot, backintime, startup." "installation complete!" archlinux pacman -sy bitwarden chromium dolphin kiwix-desktop libreoffice-fresh python jdk21-openjdk openjdk21-doc openjdk21-src code drawio-desktop handbrake veracrypt bluez bluez-utils cups system-config-printer cinnamon gnome gnome-extra ntfs-3g gvim exfat-utils htop dosfstools curl p7zip yay clone https://aur.archlinux.org/yay.git ~/downloads/yay cd makepkg -si --noconfirm rm -rf yay -s nordvpn-bin backintime github-desktop minecraft-launcher pcsx2-git system specific -syu intel-ucode nvidia nvidia-settings nvidia-utils intel-media-driver vulkan-intel opensnitch, cups, bluetooth "remember chocolatey winget software winget -e --id idrix.veracrypt valve.steam intel.inteldriverandsupportassistant zoom.zoom gimp.gimp audacity.audacity bitwarden.bitwarden obsproject.obsstudio microsoft.office mojang.minecraftlauncher librewolf.librewolf nordvpn.nordvpn dolphinemulator.dolphin oxen.session openwhispersystems.signal mozilla.thunderbird google.androidstudio blenderfoundation.blender jetbrains.clion wiresharkfoundation.wireshark qbittorrent.qbittorrent github.githubdesktop microsoft.visualstudiocode eloston.ungoogled-chromium python.python.3.12 jetbrains.webstorm rubyinstallerteam.ruby.3.1 jetbrains.intellijidea.community.eap videolan.vlc vim.vim oracle.virtualbox dbbrowserforsqlite.dbbrowserforsqlite llvm.llvm love2d.love2d jetbrains.pycharm.community freecad.freecad flameshot.flameshot gog.galaxy thedocumentfoundation.libreoffice kde.kdenlive mozilla.firefox jgraph.draw curl.curl kitware.cmake duplicati.duplicati chocolatey choco samsung-magician pcsx2 php qflipper youtube-dl-gui dotnet luarocks lua 7zip gzdoom nodejs-lts go filezilla installed as exe: nvidia display driver, rpcs3, simple64, cemu, davinci resolve final notes "make sure startup. also windows mobility centre stuff features like the vms, bitlocker" add repos of other ubuntu versions, focal, oracular, plucky define repository components components="main universe restricted multiverse" backup existing sources.list cp /etc/apt/sources.list /etc/apt/sources.list.bak repositories { "# focal (20.04)" for component in $components; do "deb http://archive.ubuntu.com/ubuntu focal $component" focal-updates focal-security done oracular" oracular oracular-updates oracular-security plucky" plucky plucky-updates plucky-security } -a update package lists "updating lists..." a from specific release (optional example) "to release, use following syntax:" "sudo -t <release> <package-name>" "example: vim" snap :( /etc/apt/preferences.d/nosnap.pref snapd android-file-transfer blender chromium-browser cmake dasher gcc gdb golang love lua5.4 luajit man-db manpages neofetch neovim openjdk-21-doc openjdk-21-source php8.3 rsync ruby sqlitebrowser steam tmux vim-gui-common virtualbox wireshark youtubedl-gui dotnet-sdk-9.0 regular snap drawio session-desktop nordvpn classic classicpkgs="android-studio clion pycharm-community webstorm intellij-idea-community " pkg $classicpkgs; "$pkg" --classic librewolf local debs ~/.lavashield/pkgs/u/*.deb; dpkg -i "$file"; startup" installed via .deb: veracrypt, gzdoom, minecraft .appimage: rpcs3, cemu, import os subprocess sys configuration block centralized easy customization config = general packages all setups "general_packages": ( "base-devel pycharm-community-edition "man-db man-pages npm intellij-idea-community-edition "rsync pipewire pipewire-pulse pipewire-alsa reflector "vulkan-icd-loader vulkan-tools vulkan-validation-layers lib32-vulkan-icd-loader "lib32-libglvnd mesa lib32-mesa ), "aur_general_packages": "backintime librewolf-bin zoom webstorm", desktop-specific "desktop_packages": "audacity "libreoffice-fresh "sqlitebrowser wireshark-qt "redshift pipewire-jack easyeffects virtualbox-host-modules-arch "kdenlive "aur_desktop_packages": "qflipper-bin davinci-resolve session-desktop-bin yt-dlg-git pcsx2-latest-bin android-studio crossover github-desktop-bin ", "desktop_services": "bluetooth.service cups.service opensnitchd", server-specific "server_packages": "docker docker-compose openssh ufw", "server_services": "sshd docker gpu drivers graphics stack "nvidia_dedicated_gpu_packages": "nvidia lib32-nvidia-utils" "amd_dedicated_gpu_packages": "xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon mesa-vdpau "lib32-mesa-vdpau opencl-mesa" "intel_integrated_gpu_packages": "intel-media-driver lib32-vulkan-intel" "amd_integrated_gpu_packages": "vulkan-radeon lib32-mesa-vdpau" cpu microcode "amd_cpu_microcode": "amd-ucode", "intel_cpu_microcode": "intel-ucode", logging "log_file": "/var/log/arch_setup.log", shit remove "bloat_packages": "welcome" utility functions def print_blue(text): """prints text blue emphasis.""" print(f"\033[1;34m{text}\033[0m") run_command(command, description, fail_message, exit_on_fail=true): """executes shell command, logs success or failure, optionally exits on failure.""" try: subprocess.run(command, shell=true, check=true) except subprocess.calledprocesserror e: print_blue(f"{fail_message}\nerror: {e}") if exit_on_fail: sys.exit(1) install_packages(name, package_list): """installs specified list of using pacman.""" print_blue(f"installing {name} packages...") run_command(f"sudo {package_list}", f"installed packages", f"failed packages") install_aur_packages(name, aur yay.""" run_command(f"yay manage_services(services): """enables starts systemd services.""" service services.split(): service: print_blue(f"enabling starting {service} service...") {service}", f"enabled exit_on_fail=false) f"started pre-checks pre_checks(): """ensures script is run root installs not present.""" os.geteuid() != 0: print("this must be root!") subprocess.call("command -v yay", shell=true) print_blue("installing helper...") run_command( "git ~/downloads/yay", "installed yay", "failed yay" ) setup setup_gpu(): gpu_choice get_valid_input("do you have discrete (dedicated) gpu? (yes/no): ["yes", "no"]) == "yes": gpu_brand get_valid_input("which brand your (nvidia/amd): ["nvidia", "amd"]) "nvidia": install_packages("nvidia drivers", config["nvidia_dedicated_gpu_packages"]) else: install_packages("amd config["amd_dedicated_gpu_packages"]) elif integrated cpu? cpu_brand graphics? (intel/amd): ["intel", "intel": install_packages("intel integrated graphics config["intel_integrated_gpu_packages"]) config["amd_integrated_gpu_packages"]) setup_cpu(): (amd/intel): ["amd", "intel"]) install_packages(f"{cpu_brand.upper()} microcode", config[f"{cpu_brand}_cpu_microcode"]) general_setup(): setup_gpu() setup_cpu() packages...") install_packages("general", config["general_packages"]) install_aur_packages("aur general", config["aur_general_packages"]) server setup_server(): install_packages("server", config["server_packages"]) manage_services(config["server_services"]) run_command("sudo ufw allow ssh enable", "configured firewall", configure firewall") desktop setup_desktop(): install_packages("desktop", config["desktop_packages"]) desktop", config["aur_desktop_packages"]) manage_services(config["desktop_services"]) input validation get_valid_input(prompt, valid_choices, error_message="invalid choice."): """gets valid input user re-prompting until choice made.""" while true: input(prompt).strip().lower() valid_choices: return print_blue(f"{error_message} please enter one of: {', '.join(valid_choices)}") main function main(): """main entry point script.""" pre_checks() print_blue("welcome arch linux setup script!") setup_choice get_valid_input("what would set up?\n1. server\n2. desktop\nenter (1/2): ["1", "2"]) general_setup() "1": setup_server() "2": setup_desktop() print_blue("removing bloat") -rs {config["bloat_packages"]}", "removing bloat", to remove print_blue("bloat removed") print_blue("enabling clipboard for vim") open(os.path.expanduser("~/.vimrc"), "a") vimrc: vimrc.write("set clipboard=unnamedplus\n") print_blue("vim enabled") print_blue("setup finished! additionally don't forget back time, startup.") __name__ "__main__": main() lib32-mesa" nordvpn-bin", "general_services": "", wine "zathura zathura-pdf-poppler redshift easyeffects" "qflipper-bin", laptop-specific "laptop_packages": "tlp tlp-rdw thermald cpupower auto-cpufreq powertop tlpui fancontrol lm_sensors" "laptop_services": "tlp.service thermald.service cpupower.service fancontrol.service", "/var/log/arch_setup.log" log_message(message, log_file=config["log_file"]): """logs messages log file.""" open(log_file, log: log.write(f"{message}\n") log_message(f"running: {command}") log_message(f"success: {description}") log_message(f"error: laptop power management setup_laptop(): get_valid_input("is this laptop? laptop power management performance tools...") install_packages("laptop management", config["laptop_packages"]) manage_services(config["laptop_services"]) setup_laptop() review at /var/log/arch_setup.log details.") #!/bin/sh ---------- install notes context modern --- choices start components: select kernel-dbg, lib32, ports, src partitioning: pool type/disks: stripe: disk name: zroot (change this) force 4k sectors?: yes encrypt disks?: partition scheme: gpt (uefi) swap size: ram size mirror swap?: no regdomain selection: apac/au network settings: yes ipv4 dhcp system configuration: ntpd: ntpd_sync_on_start: powerd: dumpdev: hardening: hide_uids: hide_gids: hide_jail: no (?) read_msgbuf: random_pid: clear_tmp: secure_console: add users: defaults + zfs encryption end "script start" read -p "what username: username "alight $username, lets this..." -sp "enter password: user_password packages="curl bash qtcreator kmymoney gnucash" flag automatically confirms installation $packages sysrc kld_list+=linux kld_list+=linux64 "proc /proc procfs rw 0 0" >> /etc/fstab general upgrade kernel freebsd-update fetch xorg pw groupmod video -m alex intel drm-kmod kld_list+=i915kms nvidia-driver linux_enable="yes" kld_list+=nvidia-modeset desktop environment *added proc line dbus_enable="yes" lightdm lightdm-gtk-greeter lightdm_enable="yes" "add etc/sudoers" cinnamon" virtualbox-host-modules-arch" "kdenlive" session-desktop-bin", 
