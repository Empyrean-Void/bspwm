#! /bin/sh

# Import Current Theme

DIR="$HOME/.config/bspwm"
STYLE="wave"
RASI="$DIR/themes/$STYLE/rofi/config.rasi"

chosen=$(printf "  Power Off\n  Restart\n  Suspend\n  Log Out\n  Lock" | rofi -dmenu -config ${RASI} -i -p "Power Menu:")

case "$chosen" in
	"  Power Off") poweroff ;;
	"  Restart") reboot ;;
	"  Suspend") systemctl suspend ;;
	"  Log Out") bspc quit ;;
	"  Lock") betterlockscreen -l ;;
	*) exit 1 ;;
esac
