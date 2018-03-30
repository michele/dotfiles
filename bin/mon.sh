if xrandr | grep "eDP-1 connected"; then
    outputs="--output eDP-1 --primary --auto --pos 581x2376 --dpi 220 --scale 1x1"

    xrandr --output DP-2 --off

    if xrandr | grep "DP-2 connected"; then
        outputs+=" --output DP-2 --auto --pos 0x0 --above eDP-1 --scale 1.3x1.3"
    fi

    xrandr $outputs

    if xrandr | grep "DP-2 connected"; then
        xrandr --output DP-2 --pos 0x0
        xrandr --output eDP-1 --pos 581x2808
    fi
fi
if xrandr | grep "eDP1 connected"; then
    outputs="--output eDP1 --primary --auto --pos 581x2376 --dpi 192 --scale 1x1"

    xrandr --output DP1 --off

    if xrandr | grep "^DP1 connected"; then
        outputs+=" --output DP1 --auto --pos 0x0 --above eDP1 --scale 1.3x1.3"
    fi

    xrandr $outputs

    if xrandr | grep "^DP1 connected"; then
        xrandr --output DP1 --pos 0x0
        xrandr --output eDP1 --pos 581x2808
    fi
fi
exit 0

