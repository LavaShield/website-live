#!/bin/bash


# Brew Install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Brew Packages
brew install \















# =======================================================================================================

 androidstudio apac appimage apt arch arch_setup archive archlinux as at au audacity aur aur_desktop_packages aur_general_packages auto automatically back backintime backup bak base bash be bin bitlocker bitwarden blender blenderfoundation bloat bloat_packages block blue bluetooth bluez brand browser call calledprocesserror cd centralized centre change check choco choice choices chromium cinnamon classicpkgs clear_tmp clion clipboard clone cmake code com command common community component components compose config configure configured confirms context cp cpu cpu_brand cpufreq cpupower crossover cups curl customization d dasher davinci db dbbrowserforsqlite dbg dbus_enable deb debs dedicated def defaults define description desktop desktop_packages desktop_services details devel dhcp discrete disk disks display dlg do docker dolphin dolphinemulator don done dosfstools dotnet downloads dpkg draw drawio driver drivers drm dumpdev duplicati e eap easy easyeffects edition elif eloston else emphasis enable enabled enables enabling encrypt encryption end ensures enter entry environment error error_message etc example except exe executes exfat existing exit exit_on_fail exits expanduser extra f fail_message failed failure false fancontrol features fetch file filezilla final finished firefox flag flameshot focal following force forget freebsd freecad fresh from fstab function functions galaxy gcc gdb general general_packages general_services get_valid_input geteuid gets gimp git github githubdesktop gnome gnucash go gog golang google gpt gpu gpu_brand gpu_choice graphics greeter groupmod gtk gui gvim handbrake hardening have helper hide_gids hide_jail hide_uids host htop http https i i915kms icd id idea idrix if import in input install_aur_packages install_packages installation installed installing installs intel intel_cpu_microcode intel_integrated_gpu_packages inteldriverandsupportassistant intellij intellijidea invalid ipv4 is jack jdk21 jetbrains jgraph join kde kdenlive kernel kitware kiwix kld_list kmod kmymoney laptop laptop_packages laptop_services latest launcher lavashield layers lets lib32 libglvnd libreoffice librewolf lightdm lightdm_enable like line linux linux_enable linux64 list lists llvm lm_sensors loader log log_file log_message logging logs love love2d lower lts lua lua5 luajit luarocks m made magician main make makepkg man manage_services management media mesa message messages microcode microsoft minecraft minecraftlauncher mirror mobility modern modeset modules mojang mos mozilla multiverse must n n1 n2 name nenter neofetch neovim nerror network no noconfirm nodejs nordvpn nosnap not npm ntfs ntpd ntpd_sync_on_start nvidia nvidia_dedicated_gpu_packages obsproject obsstudio office on one open opencl openjdk openjdk21 opensnitchd openssh openwhispersystems optional optionally or oracle oracular org os other oxen p p7zip package package_list packages pacman partition partitioning password path pcsx2 pdf performance php php8 pipewire pkg pkgs please plucky point pool poppler ports powerd powertop pref preferences present print print_blue printer prints proc procfs prompt prompting pulse pw pycharm python qbittorrent qflipper qt qtcreator radeon ram random_pid rdw re read read_msgbuf rectangle redshift reflector regdomain regular release remember removed removing repos repositories repository resolve restricted return review rf rm root rs rsync ruby rubyinstallerteam run run_command running rw s samsung scheme script sdk sectors secure_console security select selection server server_packages server_services service services session set settings setup setup_choice setups sh shell shit si signal simple64 snapd software source sources sp specific specified split sqlitebrowser src ssh sshd stack start started starting starts startup steam strip stripe studio stuff subprocess success sudo sudoers sure swap sy syntax sys sysrc system systemd syu t text the thedocumentfoundation thermald this thunderbird time tlp tlpui tmux to tools transfer true try type u ubuntu ucode uefi ufw ungoogled universe unnamedplus until up update updates updating upgrade upper use user user_password users using utility utils v valid valid_choices validation valve var vdpau veracrypt versions via video videolan vim vimrc virtualbox visualstudiocode vlc vms vulkan webstorm welcome what which while windows wine wireshark wiresharkfoundation would write xf86 xorg yay yes you your yt zathura zfs zoom zroot




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
 
