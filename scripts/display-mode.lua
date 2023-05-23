#!/usr/bin/env lua

-- Required modules
local io = require("io")

-- Import Current Theme
local DIR = os.getenv("HOME") .. "/.config/bspwm"
local STYLE = "gruvbox"
local RASI = DIR .. "/themes/" .. STYLE .. "/rofi/display.rasi"

-- Function to check if a display is connected
local function is_display_connected(display)
    local xrandr_output = io.popen("xrandr -q"):read("*a")
    return string.find(xrandr_output, display .. " connected") ~= nil
end

-- Function to configure displays for Dual Display mode
local function configure_dual_display()
    if is_display_connected("DP-2") then
        if not is_display_connected("HDMI-0") then
            return
        end
        os.execute("xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                   "--output DP-2 --mode 1920x1080 --pos 0x1080 --rotate normal")
    end

    if is_display_connected("eDP-1-1") then
        if not is_display_connected("HDMI-0") then
            return
        end
        os.execute("xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                   "--output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal")
    end
end

-- Function to configure displays for External mode
local function configure_external_display()
    if is_display_connected("DP-2") then
        if not is_display_connected("HDMI-0") then
            return
        end
        os.execute("xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                   "--output DP-2 --off")
    end

    if is_display_connected("eDP-1-1") then
        if not is_display_connected("HDMI-0") then
            return
        end
        os.execute("xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                   "--output eDP-1-1 --off")
    end
end

-- Function to configure displays for Laptop mode
local function configure_laptop_display()
    if is_display_connected("DP-2") then
        if not is_display_connected("HDMI-0") then
            return
        end
        os.execute("xrandr --output HDMI-0 --off " ..
                   "--output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal")
    end

    if is_display_connected("eDP-1-1") then
        if not is_display_connected("HDMI-0") then
            return
        end
        os.execute("xrandr --output HDMI-0 --off " ..
                   "--output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal")
    end
end

-- Main logic
local chosen = io.popen("printf '󰍺  Dual Display\n󰍹  External\n󰍹  Laptop' | rofi -dmenu -config " .. RASI .. " -i -p 'Display Mode:'"):read("*a"):gsub("\n", "")

if chosen == "󰍺  Dual Display" then
    configure_dual_display()
elseif chosen == "󰍹  External" then
    configure_external_display()
elseif chosen == "󰍹  Laptop" then
    configure_laptop_display()
end

os.execute(DIR .. "/themes/polybar.sh &")
