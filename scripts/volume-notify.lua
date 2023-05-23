#!/usr/bin/env lua

local bar_color = "#8fa598"
local volume_step = 10

-- Uses regex to get volume from pactl
local function get_volume()
    local handle = io.popen("pactl get-sink-volume @DEFAULT_SINK@")
    local output = handle:read("*all")
    handle:close()

    local volume = tonumber(string.match(output, '(%d+)%%'))
    return volume or 0
end

-- Uses regex to get mute status from pactl
local function get_mute()
    local handle = io.popen("pactl get-sink-mute @DEFAULT_SINK@")
    local output = handle:read("*all")
    handle:close()

    return string.match(output, 'Mute: (%a+)')
end

-- Returns a mute icon, a volume-low icon, or a volume-high icon, depending on the volume
local function get_volume_icon()
    local volume = get_volume()
    local mute = get_mute()

    if volume == 0 or mute == "yes" then
        return "󰝟 "
    elseif volume < 50 then
        return "󰖀 "
    else
        return "󰕾 "
    end
end

-- Displays a volume notification using dunstify
local function show_volume_notif()
    local volume = get_volume()
    local volume_icon = get_volume_icon()

    os.execute(string.format("dunstify -t 1000 -r 2593 -u normal '%s%s%%' -h int:value:%d -h string:hlcolor:%s",
        volume_icon, volume, volume, bar_color))
end

local action = arg[1]

if action == "up" then
    -- Unmutes and increases volume, then displays the notification
    os.execute("pactl set-sink-mute @DEFAULT_SINK@ 0")
    os.execute("pactl set-sink-volume @DEFAULT_SINK@ +" .. volume_step .. "%")
    show_volume_notif()
elseif action == "down" then
    -- Raises volume and displays the notification
    os.execute("pactl set-sink-volume @DEFAULT_SINK@ -" .. volume_step .. "%")
    show_volume_notif()
elseif action == "mute" then
    -- Toggles mute and displays the notification
    os.execute("pactl set-sink-mute @DEFAULT_SINK@ toggle")
    show_volume_notif()
end
