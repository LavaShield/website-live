# Installed Locally
kiwix lenovo-service-bridge microsoft-office nvidia-drivers 




obs pcsx2 python3 qbittorrent" + 
                 "samsung-magician signal thunderbird veracrypt vlc vscode youtube-dlg" +
                 "rufus"


# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Install Chocolatey Packages
choco install audacity bitwarden dolphin drawio firefox flameshot gimp github-desktop handbrake intel-dsa libreoffice-fresh librewolf nordvpn




print("Packages Installed, Now Do This:",
      "- Uninstall Onedrive",
      "- Disable Windows Fast Startup",
      "- Enable Windows Sandbox",
      "- Do All Windows Updates",
      "- Change Device Name",
      "- Thinkpad Updates From Service Bridge",
      "- Intel-DSA Updates")
