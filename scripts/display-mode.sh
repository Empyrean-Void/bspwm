#! /bin/sh

# Import Current Theme

DIR="$HOME/.config/bspwm"
STYLE="gruvbox"
RASI="$DIR/themes/$STYLE/rofi/display.rasi"

chosen=$(printf "󰍺  Dual Display\n󰍹  External\n󰍹  Laptop" | rofi -dmenu -config ${RASI} -i -p "Display Mode:")

case "$chosen" in
    "󰍺  Dual Display")
        # Nvidia
        if [[ $(xrandr -q | grep "DP-2 connected") ]]; then
            if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]]; then
                exit 1
            fi
            xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
                --output DP-2 --mode 1920x1080 --pos 0x1080 --rotate normal 
        fi

        # Hybrid
        if [[ $(xrandr -q | grep "eDP-1-1 connected") ]]; then
            if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]]; then
                exit 1
            fi
            xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
                --output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal 
        fi;;
    "󰍹  External") 
        # Nvidia
        if [[ $(xrandr -q | grep "DP-2 connected") ]]; then
            if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]]; then
                exit 1
            fi
            xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
                --output DP-2 --off 
        fi

        # Hybrid
        if [[ $(xrandr -q | grep "eDP-1-1 connected") ]]; then
            if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]]; then
                exit 1
            fi
            xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
                --output eDP-1-1 --off 
        fi;;
    "󰍹  Laptop")
        # Nvidia
        if [[ $(xrandr -q | grep "DP-2 connected") ]]; then
            if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]]; then
                exit 1
            fi
            xrandr --output HDMI-0 --off \
                --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal 
        fi

        # Hybrid
        if [[ $(xrandr -q | grep "eDP-1-1 connected") ]]; then
            if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]]; then
                exit 1
            fi
            xrandr --output HDMI-0 --off \
                --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal 
        fi;;
esac

exec $DIR/themes/polybar.sh &
