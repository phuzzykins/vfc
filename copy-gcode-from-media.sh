#!/usr/bin/bash

cd /media
cp --parents `find -iname \*.gcode` /home/pi/gcode_files/
