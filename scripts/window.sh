# Import Current Theme
DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/window.rasi"

# Run
rofi \
    -show window \
	-config ${RASI}
