#!/usr/bin/env bash

## Files and Directories
STYLE="voyage"

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

  # Internal monitor (Intel)
  if [[ $(xrandr -q | grep "eDP1") ]];
    then
	   bash ~/.config/bspwm/themes/"$STYLE"/polybar/launch-intel.sh
  fi
}

launch_bar
