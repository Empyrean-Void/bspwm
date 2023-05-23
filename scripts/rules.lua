#!/usr/bin/env lua

-- Firefox
os.execute("bspc rule -a firefox desktop=2")

-- Thunar
os.execute("bspc rule -a Thunar desktop=3 state=floating")

-- Discord
if io.popen("xrandr -q"):read("*a"):match("HDMI-0 connected") then
    os.execute("bspc rule -a discord desktop=7")
else
    os.execute("bspc rule -a discord desktop=5")
end

-- Obs
os.execute("bspc rule -a obs desktop=8")
