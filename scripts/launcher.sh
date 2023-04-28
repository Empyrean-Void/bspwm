# Import Current Theme
DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/config.rasi"

# Run
rofi \
    -show drun \
	-kb-cancel Alt-F1 \
	-config ${RASI}
