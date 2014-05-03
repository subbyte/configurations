#!/usr/bin/env bash

# put the file under /usr/share/lightdm/

# left handed mouse except trackpoint and touchpad
xmodmap -e "pointer = 3 2 1"
xinput set-button-map "TPPS/2 IBM TrackPoint" 3 2 1
xinput set-button-map "SynPS/2 Synaptics TouchPad" 3 2 1
