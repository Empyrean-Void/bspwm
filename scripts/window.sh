# Import Current Theme
DIR="$HOME/.config/bspwm"
STYLE="tokyonight"
RASI="$DIR/themes/$STYLE/rofi/config.rasi"

# Run
rofi \
    -show window \
	-config ${RASI}
