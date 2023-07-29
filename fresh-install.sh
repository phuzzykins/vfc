#!/bin/bash

sudo apt install git -y
git config --global credential.helper store

sudo apt install tigervnc-scraping-server -y
mkdir -p ~/.vnc
vncpasswd

echo > ~/startvnc "#! /bin/bash"
echo >> ~/startvnc "x0vncserver -passwordfile /home/pi/.vnc/passwd -display :0 >/dev/null 2>&1 &"
chmod +x ~/startvnc

sudo apt install fbi -y

cd ~
git clone https://github.com/th33xitus/kiauh.git
git clone https://github.com/phuzzykins/udev-media-automount.git
git clone https://github.com/phuzzykins/vfc.git

ln -s vfc/klipper_config klipper_config

cd ~/vfc
sudo cp 90-monitor.conf /usr/share/X11/xorg.conf.d/90-monitor.conf
convert splash.png -rotate 180 splash-localized.png
sudo cp splashscreen.service /etc/systemd/system/splashscreen.service
sudo systemctl enable splashscreen
sudo systemctl disable getty@tty1

# Add to /boot/cmdline.txt
# logo.nologo consoleblank=0 loglevel=1 quiet

# Add to /boot/config.txt
# disable_splash=1

cd ~/udev-media-automount
sudo make
sudo udevadm control --reload-rules

cd ~/kiauh
./kiauh.sh

sudo raspi-config 
