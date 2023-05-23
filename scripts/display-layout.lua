#!/usr/bin/env lua

-- Function to check if a display is connected
local function is_display_connected(display)
    local xrandr_output = io.popen("xrandr -q"):read("*a")
    return string.find(xrandr_output, display .. " connected") ~= nil
end

-- Function to configure displays and workspaces for Nvidia GPU
local function configure_nvidia_displays()
    if is_display_connected("HDMI-0") then
        os.execute("xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                   "--output eDP-1-1 --mode 1920x1080 --pos 0x1080 --rotate normal")
        os.execute("bspc monitor HDMI-0 -d 1 2 3 4 5")
        os.execute("bspc monitor eDP-1-1 -d 6 7 8 9 10")
    end

    if not is_display_connected("HDMI-0") then
        os.execute("xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                   "--output HDMI-0 --off")
        os.execute("bspc monitor eDP-1-1 -d 1 2 3 4 5")
    end
end

-- Function to configure displays and workspaces for Nvidia dGPU
local function configure_nvidia_dgpu_displays()
    if is_display_connected("DP-2") then
        if is_display_connected("HDMI-0") then
            os.execute("xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                       "--output DP-2 --mode 1920x1080 --pos 0x1080 --rotate normal")
            os.execute("bspc monitor HDMI-0 -d 1 2 3 4 5")
            os.execute("bspc monitor DP-2 -d 6 7 8 9 10")
        end
        os.execute("xrandr --output DP-2 --mode 1920x1080 --pos 0x0 --rotate normal " ..
                   "--output HDMI-0 --off")
        os.execute("bspc monitor DP-2 -d 1 2 3 4 5")
    end
end

-- Function to configure displays and workspaces for Intel GPU
local function configure_intel_displays()
    if is_display_connected("eDP1") then
        os.execute("bspc monitor eDP1 -d 1 2 3 4 5")
    end
end

-- Main logic
configure_nvidia_displays()
configure_nvidia_dgpu_displays()
configure_intel_displays()
