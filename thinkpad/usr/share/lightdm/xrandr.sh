#!/usr/bin/env bash

ENABLEDP1=$(xrandr -q | grep 'DP1 connected')

if [ -n "$ENABLEDP1" ]; then
    xrandr --output LVDS1 --auto --output DP1 --auto --right-of LVDS1
else
    xrandr --output LVDS1 --auto
fi
