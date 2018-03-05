#!/bin/bash

dev=`xinput list | grep 'DELL07E6:00.*pointer'`
mxreg="^.*id=([0-9]+).*$"
if [[ $dev =~ $mxreg ]];
then
    did="${BASH_REMATCH[1]}"
    devprop=`xinput list-props $did | grep 'libinput Natural Scrolling Enabled ('`
    propreg="^.*\(([0-9]+)\).*"
    if [[ $devprop =~ $propreg ]];
    then
        echo 'Found logitech mx mouse'
        xinput set-prop $did --type=int ${BASH_REMATCH[1]} 1
    fi
else
    echo 'nope'
fi

dev=`xinput list | grep 'MX Master 2S.*pointer'`
mxreg="^.*id=([0-9]+).*$"
if [[ $dev =~ $mxreg ]];
then
    did="${BASH_REMATCH[1]}"
    devprop=`xinput list-props $did | grep 'libinput Natural Scrolling Enabled ('`
    propreg="^.*\(([0-9]+)\).*"
    if [[ $devprop =~ $propreg ]];
    then
        echo 'Found logitech mx mouse'
        xinput set-prop $did --type=int ${BASH_REMATCH[1]} 1
    fi
else
    echo 'nope'
fi
