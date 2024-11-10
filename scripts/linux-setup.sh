# Packages installed with apt
sudo apt install audacity filezilla flameshot gimp git obs-studio qbittorrent opensnitch kdenlive vim vlc sqlitebrowser wireshark backintime-common

# Install LibreWolf
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# Install Signal
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# Enable Services
sudo systemctl start --now opensnitch.service
sudo systemctl enable --now opensnitch.service

# Additional packages are Bitwarden, vscode, nordvpn, python, steam, thunderbird and veracrypt. These have been installed already via .deb

# Add flameshot, backintime, and timeshift to startup
