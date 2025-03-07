# Installed Locally
OculusSetup Nvidia-Drivers NordVPN Lenovo-Service-Bridge Lenovo-System-Update Signal
Minecraft wifi-drivers microsoft-office kiwix github-desktop yubico-authenticator

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Install Chocolatey Packages
choco install audacity bitwarden dolphin flameshot `
handbrake intel-dsa librewolf rufus samsung-magician gimp `
qbittorrent obs-studio pcsx2 python3 vlc vscode youtube-dl-gui steam




print("Packages Installed, Now Do This:",
      "- Uninstall Onedrive",
      "- Disable Windows Fast Startup",
      "- Enable Windows Sandbox",
      "- Do All Windows Updates",
      "- Change Device Name",
      "- Thinkpad Updates From Service Bridge",
      "- Intel-DSA Updates",
      "- Windows Store Updates")
