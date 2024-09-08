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
# SYSTEM CONFIGURATION:
# local_unbound: No (Optional; DNS caching typically not needed for most users.)
# sshd: No (yes if remote access to your machine is needed; otherwise No to enhance security.)
# moused: No (yes if using the mouse in command-line environments; otherwise No.)
# ntpd: Yes (for ongoing time synchronization with remote servers.)
# ntpd_sync_on_start: Yes (for immediate synchronization at ntpd start; otherwise No if periodic synchronization suffices.)
# powerd: Yes (for managing power and extending battery life.)
# dumpdev: Yes (if you want crash dumps for debugging; otherwise No if not needed or space is limited.)
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

read -p "What is your username: " username


packages = "curl"
pkg install $packages



# --- X WINDOW SYSTEM SETUP START ---
graphics_packages = "xorg drm-kmod libva-intel-driver mesa-libs mesa-dri nvidia-driver"
pw groupmod video -m $username
pw groupmod video -m root
sysrc kld_list+=i915kms
sysrc kld_list+=nvidia-modeset
# --- X WINDOW SYSTEM SETUP END ---



# --- SETUP SUDO FOR USERS START --- 

# --- SETUP SUDO FOR USERS END --- 

