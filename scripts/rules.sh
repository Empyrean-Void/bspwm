# Firefox
bspc rule -a firefox desktop=2

# Thunar
bspc rule -a Thunar desktop=3 state=floating

# Discord
if [[ $(xrandr -q | grep "HDMI-0 connected") ]];
   then
       bspc rule -a discord desktop=7
fi

if [[ $(xrandr -q | grep "HDMI-0 disconnected") ]];
   then
       bspc rule -a discord desktop=5
fi

# Obs
bspc rule -a obs desktop=8

# Elden Ring
bspc rule -a steam_app_1245620 desktop=3
