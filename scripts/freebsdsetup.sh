# below are the choices to chose when setting up your system with the installer usb
# --- INSTALL CHOICES START ---
#
# KEYMAPPING:
# >>> Continue with default keymap for US keyboard format
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
# Pool Name: zroot
# Force 4K Sectors?: YES (if you are installing on a system with relatively modern components)
# Encrypt Disks?: YES (always encrypt your devices)
# Partition Scheme: GPT (UEFI) (should be fine with all standard modern devices)
# Swap Size: ram size (really up to you, I personally like to make it the same as ram size for hybernation)
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
# SYSTEM CONFIGURATION (for a modern laptop):
# local_unbound: No (Optional; DNS caching typically not needed for most users.)
# sshd: No (yes if remote access to your machine is needed; otherwise No to enhance security.)
# moused: No (yes if using the mouse in command-line environments; otherwise No.)
# ntpd: Yes (for ongoing time synchronization with remote servers.)
# ntpd_sync_on_start: Yes (for immediate synchronization at ntpd start; otherwise No if periodic synchronization suffices.)
# powerd: Yes (for managing power and extending battery life.)
# dumpdev: Yes (if you want crash dumps for debugging; otherwise No if not needed or space is limited.)
# --- INSTALL CHOICES END ---
