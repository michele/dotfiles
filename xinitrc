#!/bin/bash
source ~/.profile
xmodmap ~/.xmodmaprc
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
exec i3
