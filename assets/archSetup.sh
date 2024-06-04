#!/bin/bash

# Function to print text in bright blue
print_bright_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

# System services, starting and enabling them
echo "starting bluetooth system service"
sudo systemctl start bluetooth.service
echo "bluetooth system service started"
echo "enabling bluetooth system service"
sudo systemctl enable bluetooth.service
echo "bluetooth system service enabled"

# Installing yay
echo "installing yay"
cd ~/Downloads || exit
git clone https://aur.archlinux.org/yay.git
cd yay || exit
{
    printf 'y\n'  # Send 'y' and Enter for the [Y/n] prompt
} | makepkg -si --noconfirm
cd ..
rm -rf yay
echo "yay installed"

# Flagging script as being concluded
print_bright_blue "Setup Finished ;)"
