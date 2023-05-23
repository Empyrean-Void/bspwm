#!/usr/bin/env lua

-- Execute system commands
os.execute("nitrogen --restore &")
os.execute("picom --config ~/.config/bspwm/picom.conf &")
os.execute("numlockx &")
os.execute("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &")
