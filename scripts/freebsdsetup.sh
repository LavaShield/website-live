#!/bin/sh

# ---SH SCRIPTING NOTES START ---
# Prompt Message Inline: You can also provide the prompt message directly with the read command:
#  read -p "Please enter your response: " user_input
#
# Silent Input: If you need to capture input without showing it (like for passwords), use the -s option:
#  read -sp "Enter your password: " user_password
#  echo
#
# The -s option makes the input silent (no characters are displayed), and echo is used to print a newline after input.
# ---SH SCRIPTING NOTES END ---


# ---------- INSTALL NOTES ----------
# below are the choices to chose when setting up your system with the installer usb in the context of a modern laptop
# --- INSTALL CHOICES START ---
#
# KEYMAPPING:
# >>> Continue with default keymap for US keyboard format
#
# SET HOSTNAME:
# >>> Pick name for computer in accordance with standards
#
# COMPONENTS:
# >>> Have components kernel-dbg, lib32, ports, src
#
# PARTITIONING:
# >>> (for 1 storage systems, no raid)
# >>> Auto (ZFS)
# >>> ZFS Configurations
# Pool Type/Disks: stripe: 1 disk
# Pool Name: zroot (CHANGE THIS, on accordance with standardisations)
# Force 4K Sectors?: YES (if you are installing on a system with relatively modern components)
# Encrypt Disks?: YES
# Partition Scheme: GPT (UEFI)
# Swap Size: ram size
# Mirror Swap?: NO (not really necessary in the context of a regular users setup, regular consumer hw is reliable enough)
# Encrypt Swap? YES (encrypt everything)
#
# REGDOMAIN SELECTION:
# >>> Depends on your location, i for instance would go with APAC/AU being in the Asia Pacific Region
#
# NETWORK SETTINGS:
# >>> Yes to configure ipv4 and dhcp
# >>> Yes for ipv6 and the SLAAC
#
# TIME ZONE SELECTOR:
# >>> Select your timezone :O
#
# SYSTEM CONFIGURATION:
# local_unbound: No
# sshd: No
# moused: No
# ntpd: Yes
# ntpd_sync_on_start: Yes
# powerd: Yes
# dumpdev: Yes
#
# SYSTEM HARDENING:
# hide_uids: Yes (Provides additional security by hiding user IDs from non-privileged users, reducing the risk of information leakage about system accounts.)
# hide_gids: Yes (Enhances security by hiding group IDs from non-privileged users, limiting exposure of system group information.)
# hide_jail: No (Not typically necessary for a regular laptop user. This option is more relevant for systems using jails where you want to obscure their presence.)
# read_msgbuf: Yes (Prevents non-privileged users from accessing kernel messages, which could contain sensitive system information.)
# proc_debug: No (Restricts access to process information, which might interfere with debugging tools. Generally not needed for regular users unless you have specific debugging needs.)
# random_pid: Yes (Improves security by randomizing process IDs, making it harder for attackers to predict and exploit process IDs.)
# clear_tmp: Yes (Clears temporary files on boot, helping to remove potentially sensitive data and reduce clutter.)
# disable_syslogd: No (Disabling system logging is not recommended as it is crucial for monitoring and troubleshooting. Properly configuring syslogd is preferred.)
# secure_console: Yes (Adds an extra layer of protection to the console, preventing unauthorized access to critical system points.)
# disable_ddtrace: No (Generally unnecessary to disable unless you have specific concerns. DTrace can be useful for performance monitoring and debugging.)
#
# ADD USERS:
# >>> Just go with default for everything but select yes for ZFS encryption (make sure user password is not same as encryption keyphrase for ZFS dataset)
#
# --- INSTALL CHOICES END ---
echo "SCRIPT START"

read -p "What is your username: " username
echo "Alight $username, lets do this..."

pkg update
pkg upgrade

packages="curl bash qtcreator vim libreoffice kmymoney gnucash"
# the -y flag to pkg install automatically confirms the installation
pkg install -y $packages
sysrc kld_list+=linux
sysrc kld_list+=linux64
sysrc linux_enable="YES"

#broken packages: vscode

# --- GUI SETUP START ---
# xorg and drivers
graphics_packages="xorg drm-kmod libva-intel-driver mesa-libs mesa-dri nvidia-driver gnome cinnamon lightdm lightdm-gtk-greeter"
pkg install -y $graphics_packages
pw groupmod video -m $username
pw groupmod video -m root
sysrc kld_list+=i915kms
sysrc kld_list+=nvidia-modeset
echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
sysrc dbus_enable="YES"
sysrc lightdm_enable="YES"
sysrc nvidia_xorg_enable="YES"
# --- GUI SETUP END ---


# --- SETUP SUDO FOR USERS START --- 
pkg install -y sudo
echo "GO TO etc/sudoers and add '$username    ALL=(ALL) ALL',  right below the root entry"
# --- SETUP SUDO FOR USERS END --- 











# --- general ---
pkg update && pkg upgrade
pkg install vim
# --- xorg setup ---
pkg install xorg
pw groupmod video -m alex
pw groupmod video -m root
# --- intel graphics ---
pkg install drm-kmod libva-intel-driver mesa-libs mesa-dri
sysrc kld_list+=i915kms
# --- nvidia graphics ---
pkg install nvidia-driver
sysrc linux_enable="YES"
sysrc kld_list+=nvidia-modeset
# --- desktop environment ---
pkg install cinnamon
*added proc line to /etc/fstab
sysrc dbus_enable="YES"
pkg install lightdm lightdm-gtk-greeter
sysrc lightdm_enable="YES"

