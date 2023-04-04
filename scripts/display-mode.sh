#! /bin/sh

# Import Current Theme

DIR="$HOME/.config/bspwm"
STYLE="wave"
RASI="$DIR/themes/$STYLE/rofi/config.rasi"

chosen=$(printf "󰍺  Dual Display\n󰍹  External\n󰍹  Laptop" | rofi -dmenu -config ${RASI} -i -p "Display Mode:")

case "$chosen" in
	"󰍺  Dual Display") xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal;;
	"󰍹  External") xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output eDP-1-1 --off;;
	"󰍹  Laptop") xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output HDMI-0 --off;;
	*) exit 1 ;;
esac

exec $DIR/themes/polybar.sh &
