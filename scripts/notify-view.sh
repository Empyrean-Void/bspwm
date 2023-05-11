#! /bin/sh

# Import Current Theme

DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/notify.rasi"
LOG=~/.log/dunst-log

get_date() {
    awk -F'---' '{print $2}' $LOG | sed 's/^[[:space:]]*//' | sed '/^$/d' | uniq 
}

get_content() {
    awk -F'string "' '{gsub(/,$/,""); print $3, $4}' $LOG | sed '/^%/{N;d;}' | tr -d '\n' | sed 's/[,"]//g'
}

(get_date && get_content) | rofi -dmenu -config ${RASI} -i -p "Notifications: "
