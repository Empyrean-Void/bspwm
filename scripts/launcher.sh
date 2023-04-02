# Import Current Theme
DIR="$HOME/.config/bspwm"
STYLE="wave"
RASI="$DIR/themes/$STYLE/rofi/config.rasi"

# Run
rofi \
    -show drun \
	-kb-cancel Alt-F1 \
	-config ${RASI}
