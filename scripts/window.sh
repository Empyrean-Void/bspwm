# Import Current Theme
DIR="$HOME/.config/bspwm"
STYLE="rose-pine"
RASI="$DIR/themes/$STYLE/rofi/config.rasi"

# Run
rofi \
    -show window \
	-kb-cancel Alt-F1 \
	-config ${RASI}
