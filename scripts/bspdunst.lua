#!/usr/bin/env lua

-- Required modules
local io = require("io")

-- bspwm directory
local DIR = os.getenv("HOME") .. "/.config/bspwm"

-- Launch dunst daemon
local dunst_pid = io.popen("pidof dunst"):read("*a"):gsub("\n", "")

if dunst_pid ~= "" then
    os.execute("pkill dunst")
end

os.execute("dunst -config " .. DIR .. "/dunstrc &")
