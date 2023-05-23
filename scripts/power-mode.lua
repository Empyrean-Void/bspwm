#!/usr/bin/env lua

-- Import Current Theme
local DIR = os.getenv("HOME") .. "/.config/bspwm"
local STYLE = "gruvbox"
local RASI = DIR .. "/themes/" .. STYLE .. "/rofi/power-save.rasi"

-- Run
local options = "󰾆  Power Save\n󰾅  Balanced\n󰓅  Performance"
local chosen = io.popen(string.format('echo "%s" | rofi -dmenu -config %s -i -p "Power Mode:"', options, RASI)):read("*l")

if chosen == "󰾆  Power Save" then
    os.execute("powerprofilesctl set power-save")
elseif chosen == "󰾅  Balanced" then
    os.execute("powerprofilesctl set balanced")
elseif chosen == "󰓅  Performance" then
    os.execute("powerprofilesctl set performance")
else
    os.exit(1)
end
