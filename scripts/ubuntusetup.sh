# Packages installed with apt
sudo apt install \
audacity wireshark firefox love filezilla kdenlive opensnitch vim vlc thunderbird blender \
qbittorrent dolphin-emu obs-studio backintime-common qflipper dasher timeshift git steam \
neovim curl android-file-transfer chromium-browser libreoffice python3.13 gimp flameshot \
freecad



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

# Final Notes
echo "Make sure to add flameshot, backintime, and timeshift to startup"

# Installed via .deb: bitwarden, veracrypt, session, minecraft, github-desktop, android-studio, clion, iina, gzdoom, gog-galaxy, nordvpn, vscode
