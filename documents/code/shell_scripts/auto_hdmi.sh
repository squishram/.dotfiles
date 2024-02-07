#!/bin/sh

intern=$(xrandr | grep -i primary | awk '{print $1}')
extern=HDMI-1

while true; do
    if xrandr | grep "$extern disconnected"; then
        xrandr --output "$extern" --off --output "$intern" --auto
    else
        xrandr --output "$intern" --off --output "$extern" --auto
    fi
    sleep 10s
done
