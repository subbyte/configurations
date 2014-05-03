#!/usr/bin/env bash

# put the file under /usr/share/lightdm/

# set back trackpoint and touchpad to right handed
xinput set-button-map "TPPS/2 IBM TrackPoint" 3 2 1
xinput set-button-map "SynPS/2 Synaptics TouchPad" 3 2 1
