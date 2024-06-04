import os
import subprocess
import sys

def print_bright_blue(text):
    print(f"\033[1;34m{text}\033[0m")

def run_command(command):
    result = subprocess.run(command, shell=True)
    if result.returncode != 0:
        sys.exit(result.returncode)

# System services, starting and enabling them
print("starting and enabling system services")
run_command("sudo systemctl start bluetooth.service")
run_command("sudo systemctl enable bluetooth.service")
run_command("sudo systemctl start cups.service")
run_command("sudo systemctl enable cups.service")
print("system service started and enabled")

# Installing yay
print("installing yay")
os.chdir(os.path.expanduser("~/Downloads"))
run_command("git clone https://aur.archlinux.org/yay.git")
os.chdir("yay")
run_command("printf 'y\n' | makepkg -si --noconfirm")
os.chdir("..")
run_command("rm -rf yay")
print("yay installed")

# Install yay packages
run_command("yay -S drawio clion github-desktop librewolf-bin nordvpn-bin pycharm-professional qflipper zoom")

# Flagging script as being concluded
print_bright_blue("Setup Finished ;)")



if __name__ == "__main__":
  main()
