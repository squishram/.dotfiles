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

# Disable beep
xset b off

# # lock the screen on hibernate
# xss-lock slock &

# Set keyboard with capslock -> crtl
setxkbmap -layout gb -option ctrl:nocaps

# Settings for hiding the mouse cursor
unclutter --jitter 10 --ignore-scrolling --sart-hidden --fork

# source this file to set the mouse cursor & size
xrdb $HOME/.Xresources

# window manager
exec leftwm
