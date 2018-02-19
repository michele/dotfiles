total=$(xrandr --current | grep '\bconnected' | wc -l)
outputs="--output eDP-1 --primary --auto --pos 581x2376 --dpi 220 --scale 1x1"

xrandr --output DP-2-1 --off

if xrandr | grep "DP-2-1 connected"; then
	outputs+=" --output DP-2-1 --auto --pos 0x0 --above eDP-1 --scale 2.2x2.2"
fi

xrandr $outputs

if xrandr | grep "DP-2-1 connected"; then
	xrandr --output DP-2-1 --pos 0x0
	xrandr --output eDP-1 --pos 581x2376
fi
