# below are the choices to chose when setting up your system with the installer usb
# --- INSTALL CHOICES START ---
# KEYMAPPING:
# >>> Continue with default keymap for US keyboard format
# >>> Pick name for computer in accordance with standards
# COMPONENTS:
# >>> Have components kernel-dbg, lib32, ports, src
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
# NETWORK SETTINGS:
# >>> Yes to configure ipv4 and dhcp
# >>> Yes for ipv6 and the SLAAC
# REGDOMAIN SELECTION:
# >>> Depends on your location, i for instance would go with APAC/AU being in the Asia Pacific Region
# --- INSTALL CHOICES END ---
