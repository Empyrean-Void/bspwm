#!/usr/bin/env bash

## Files and Directories
STYLE="gruvbox"

launch_bar() {
    # External monitor (Nvidia)
    if [[ $(xrandr -q | grep "HDMI-0 connected") ]];
    then
	    bash ~/.config/bspwm/themes/"$STYLE"/polybar/launch-nvidia.sh
    fi

    # Internel monitor (Nvidia)
    if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]];
    then
	    bash ~/.config/bspwm/themes/"$STYLE"/polybar/launch-nvidia.sh
    fi

    if [[ $(xrandr -q | grep "DP-2 connected") ]];
    then
        bash ~/.config/bspwm/themes/"$STYLE"/polybar/launch-nvidia-dGPU.sh
    fi
    # Internal monitor (Intel)
    if [[ $(xrandr -q | grep "eDP1") ]];
    then
       bash ~/.config/bspwm/themes/"$STYLE"/polybar/launch-intel.sh
    fi
}

killall -q polybar

launch_bar
