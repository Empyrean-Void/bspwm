#!/bin/sh
# backlight up icon is from <a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by Marz Gallery - Flaticon</a>.
# backlight down icon is from <a href="https://www.flaticon.com/free-icons/ui" title="ui icons">Ui icons created by Marz Gallery - Flaticon</a>.
# Credit from https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a & https://wiki.archlinux.org/title/Dunst  .

# You can call this script like this:
# $./screenlight.sh up
# $./screenlight.sh down

bar_color="#61afef"

function get_brightness {
     brightnessctl | awk '/Current brightness/ {print substr($NF, 2, length($NF)-3)}'
}


function send_notification {
    brightness=`get_brightness`
    # Send the notification
     dunstify -a "changeVolume" -t 1000 -r 2593 -u normal -h int:value:"$brightness" "󰃠  ${brightness}%" -h string:hlcolor:$bar_color
}

function send_notification1 {
    brightness=`get_brightness`
    # Send the notification
     dunstify -a "changeVolume" -t 1000 -r 2593 -u normal -h int:value:"$brightness" "󰃠  ${brightness}%" -h string:hlcolor:$bar_color
}
case $1 in
    up)
	# Set the brightness on 
	
	# Up the brightness (+ 10%)
	brightnessctl set +10%
	send_notification
	;;
    down)
	brightnessctl set 10%-
	send_notification1
	;;
esac
