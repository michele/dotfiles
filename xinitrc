#!/bin/bash
source ~/.profile
xmodmap ~/.xmodmaprc
setxkbmap -option compose:rctrl
setxkbmap -option compose:ralt
setxkbmap -option ctrl:nocaps
export GPG_TTY=$(tty)
export GDK_SCALE=2
gpg-connect-agent updatestartuptty /bye >/dev/null
#urxvtd -q -f -o
#pulseaudio --start
exec i3
~/.bin/mx-scroll.sh
