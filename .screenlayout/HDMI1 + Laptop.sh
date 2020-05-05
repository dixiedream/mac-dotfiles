#!/bin/sh
xrandr --output eDP1 --scale 1x1 --pos 3840x0; 
xrandr --output HDMI1 --primary --scale 2x2 --mode 1920x1080 --fb 7680x2160 --pos 0x0 --output VIRTUAL1 --off
