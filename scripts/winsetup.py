# Installed Locally
OculusSetup Signal Nvidia-Drivers Veracrypt Microsoft-Office Kiwix              


# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Install Chocolatey Packages
choco install audacity bitwarden dolphin drawio firefox flameshot gimp github-desktop handbrake intel-dsa libreoffice-fresh librewolf nordvpn rufus samsung-magician qbittorrent obs-studio pcsx2 python3 thunderbird vlc vscode youtube-dl-gui steam




print("Packages Installed, Now Do This:",
      "- Uninstall Onedrive",
      "- Disable Windows Fast Startup",
      "- Enable Windows Sandbox",
      "- Do All Windows Updates",
      "- Change Device Name",
      "- Thinkpad Updates From Service Bridge",
      "- Intel-DSA Updates",
      "- Windows Store Updates")