#!/bin/sh

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
# random_pid: Yes
# clear_tmp: Yes
# secure_console: Yes
#
# ADD USERS:
# defaults + ZFS encryption
#
# --- INSTALL CHOICES END ---
echo "SCRIPT START"

read -p "What is your username: " username
echo "Alight $username, lets do this..."

read -sp "Enter your password: " user_password
echo

packages="curl bash qtcreator vim libreoffice kmymoney gnucash"
# the -y flag to pkg install automatically confirms the installation
pkg install -y $packages
sysrc kld_list+=linux
sysrc kld_list+=linux64

echo "proc                    /proc           procfs  rw              0       0" >> /etc/fstab

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
