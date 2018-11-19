#!/bin/bash
source ~/.profile
xmodmap ~/.xmodmaprc
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
urxvtd -q -f -o
pulseaudio --start
exec i3
