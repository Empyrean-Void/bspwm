#!/usr/bin/env lua

-- Required modules
local io = require("io")

-- Function to get brightness
local function get_brightness()
    local handle = io.popen("brightnessctl | awk '/Current brightness/ {print substr($NF, 2, length($NF)-3)}'")
    local brightness = handle:read("*a"):gsub("\n", "")
    handle:close()
    return brightness
end

-- Function to send notification
local function send_notification()
    local brightness = get_brightness()
    -- Send the notification
    os.execute(string.format("dunstify -a 'changeVolume' -t 1000 -r 2593 -u normal -h int:value:'%s' '󰃠  %s%%' -h string:hlcolor:%s", brightness, brightness, "#8fa598"))
end

-- Function to send another notification
local function send_notification1()
    local brightness = get_brightness()
    -- Send the notification
    os.execute(string.format("dunstify -a 'changeVolume' -t 1000 -r 2593 -u normal -h int:value:'%s' '󰃠  %s%%' -h string:hlcolor:%s", brightness, brightness, "#8fa598"))
end

-- Main logic
local arg = arg[1]
if arg == "up" then
    -- Set the brightness up (+ 10%)
    os.execute("brightnessctl set +10%")
    send_notification()
elseif arg == "down" then
    os.execute("brightnessctl set 10%-")
    send_notification1()
end
