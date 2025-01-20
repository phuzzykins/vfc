#!/usr/bin/bash

cd /media
cp --parents `find -iname \*.gcode` /home/pi/printer_data/gcodes/
