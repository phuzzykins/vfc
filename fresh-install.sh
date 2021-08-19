#!/bin/bash

sudo apt install git -y
git config --global credential.helper store

sudo apt install tigervnc-scraping-server -y
mkdir -p ~/.vnc
vncpasswd

echo > ~/startvnc "#! /bin/bash"
echo >> ~/startvnc "x0vncserver -passwordfile /home/pi/.vnc/passwd -display :0 >/dev/null 2>&1 &"
chmod +x ~/startvnc

cd ~
git clone https://github.com/th33xitus/kiauh.git
git clone https://github.com/phuzzykins/udev-media-automount.git
git clone https://github.com/phuzzykins/vfc.git

ln -s vfc/klipper_config klipper_config
ln -s vfc/vfc-klipperscreen.conf KlipperScreen.conf
#echo "[include vfc/vfc-klipperscreen.conf]" > KlipperScreen.conf

cd ~/udev-media-automount
sudo make
sudo udevadm control --reload-rules

cd ~/kiauh
./kiauh.sh

sudo raspi-config 
