#!/bin/bash
source ~/.profile
xmodmap ~/.xmodmaprc
export GPG_TTY=$(tty)
export GDK_SCALE=2
gpg-connect-agent updatestartuptty /bye >/dev/null
urxvtd -q -f -o
pulseaudio --start
exec i3
