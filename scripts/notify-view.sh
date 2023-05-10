#! /bin/sh

# Import Current Theme

DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/notify.rasi"

cat ~/.log/dunst-log | awk -F'---' '{print $2 "\n" $3}' | sed 's/^[[:space:]]*//' | sed '/^$/d' | rofi -dmenu -config ${RASI} -i -p "Notifications: "
