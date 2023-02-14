#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login


# Disable beep
xset -b
# Set keyboard with capslock -> crtl 
setxkbmap -layout gb -option ctrl:nocaps
# Settings for hiding the mouse cursor
unclutter --jitter 10 --ignore-scrolling --sart-hidden --fork
# cleaner graphics using compositer
picom &
# start with random images in each workspace from .wallpapers folder
# feh --bg-fill --randomize ~/.config/wallpapers/pixelart/ &
# start awesome window manager
exec awesome
# start qtile window manager
# qtile start
