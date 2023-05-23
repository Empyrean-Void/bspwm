# Import Current Theme
DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/launcher.rasi"

# Run
rofi \
    -show drun \
	-config ${RASI}
