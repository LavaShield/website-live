echo "starting bluetooth system service"
sudo systemctl start bluetooth.service
echo "bluetooth system service started"
echo "enabling bluetooth system service"
sudo systemctl enable bluetooth.service
echo "bluetooth system service enabled"
echo "installing yay"
cd ~/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
Y | makepkg -si
cd ..
rm -rf yay
echo "yay installed"
echo "done"
