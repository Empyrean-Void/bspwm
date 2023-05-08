# External monitor (Nvidia)
if [[ $(xrandr -q | grep "HDMI-0 connected") ]];
   then
      xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal 
      bspc monitor HDMI-0 -d 1 2 3 4 5
      bspc monitor eDP-1-1 -d 6 7 8 9 10
      exec $BSPDIR/themes/polybar.sh &
fi

# Internel monitor (Nvidia)
if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]];
   then
      xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal \
             --output HDMI-0 --off 
      bspc monitor eDP-1-1 -d 1 2 3 4 5
      exec $BSPDIR/themes/polybar.sh &
fi

# Internal monitor (Intel)
if [[ $(xrandr -q | grep "eDP1") ]];
  then
    bspc monitor eDP1 -d 1 2 3 4 5
    exec $BSPDIR/themes/polybar.sh &
fi
