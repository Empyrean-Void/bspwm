#! /bin/sh
# Import Current Theme

DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/power-save.rasi"

chosen=$(printf "󰾆  Power Save\n󰾅  Balanced\n󰓅  Performance" | rofi -dmenu -config ${RASI} -i -p "Power Mode:")

case "$chosen" in
	"󰾆  Power Save") powerprofilesctl set power-save ;;
	"󰾅  Balanced") powerprofilesctl set balanced ;;
	"󰓅  Performance") powerprofilesctl set performance ;;
	*) exit 1 ;;
esac
