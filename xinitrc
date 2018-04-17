#!/bin/bash
source ~/.profile
xmodmap ~/.xmodmaprc
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
urxvtd -q -f -o
exec i3
