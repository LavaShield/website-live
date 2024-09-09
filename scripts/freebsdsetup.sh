#!/bin/sh

# ---SH SCRIPTING NOTES START ---
# 
# Silent Input: If you need to capture input without showing it (like for passwords), use the -s option:
#  read -sp "Enter your password: " user_password
#  echo
#
# The -s option makes the input silent (no characters are displayed), and echo is used to print a newline after input.
# ---SH SCRIPTING NOTES END ---


# ---------- INSTALL NOTES ----------
# context of a modern laptop
# --- INSTALL CHOICES START ---
#
# COMPONENTS:
# Select kernel-dbg, lib32, ports, src
#
# PARTITIONING:
# Pool Type/Disks: stripe: 1 disk
# Pool Name: zroot (CHANGE THIS)
# Force 4K Sectors?: YES
# Encrypt Disks?: YES
# Partition Scheme: GPT (UEFI)
# Swap Size: ram size
# Mirror Swap?: NO
# Encrypt Swap?: YES
#
# REGDOMAIN SELECTION:
# APAC/AU
#
# NETWORK SETTINGS:
# Yes to configure ipv4 and dhcp
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
# hide_uids: Yes
# hide_gids: Yes
# hide_jail: No (?)
# read_msgbuf: Yes
# proc_debug: No
# random_pid: Yes
# clear_tmp: Yes
# disable_syslogd: No
# secure_console: Yes
# disable_ddtrace: No
#
# ADD USERS:
# defaults + ZFS encryption
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
echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab
sysrc dbus_enable="YES"
sysrc lightdm_enable="YES"
sysrc nvidia_xorg_enable="YES"
# --- GUI SETUP END ---



# --- general ---
pkg update && pkg upgrade
pkg install vim
# --- kernel update ---
freebsd-update fetch
freebsd-update install
# --- xorg setup ---
pkg install xorg
pw groupmod video -m alex
pw groupmod video -m root
# --- intel graphics ---
pkg install drm-kmod
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
# --- sudo setup ---
pkg install sudo
echo "add entry to etc/sudoers"
