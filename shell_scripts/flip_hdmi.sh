#!/bin/sh

intern=$(xrandr | grep -i primary | awk '{print $1}')
extern=HDMI-1

if xrandr --listactivemonitors | grep "$intern"; then
    xrandr --output "$intern" --off --output "$extern" --auto
else
    xrandr --output "$extern" --off --output "$intern" --auto
fi
