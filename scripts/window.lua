#!/usr/bin/env lua

-- Import Current Theme
local DIR = os.getenv("HOME") .. "/.config/bspwm"
local STYLE = "gruvbox"
local RASI = DIR .. "/themes/" .. STYLE .. "/rofi/window.rasi"

-- Run
os.execute("rofi -show window -config " .. RASI)
