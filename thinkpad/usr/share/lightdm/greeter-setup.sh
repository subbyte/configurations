#!/usr/bin/env bash

# put the file under /usr/share/lightdm/

# light on numlock
/usr/bin/numlockx on

# left-hand mouse buttons
xmodmap -e "pointer = 3 2 1"