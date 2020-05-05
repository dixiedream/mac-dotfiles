#!/bin/sh
#xrandr --output eDP1 --mode 1600x900 --pos 0x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 1600x0 --rotate normal --output VIRTUAL1 --off

xrandr --output eDP1 --scale 1x1 --pos 0x0 ; xrandr --output HDMI1 --primary --scale 2x2 --mode 1920x1080 --fb 7680x2160 --pos 3840x0
