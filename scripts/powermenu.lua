#!/usr/bin/env lua

-- Import Current Theme

local HOME = os.getenv("HOME")
local DIR = HOME .. "/.config/bspwm"
local STYLE = "gruvbox"
local RASI = DIR .. "/themes/" .. STYLE .. "/rofi/power.rasi"

-- Function to execute system commands
local function execute_command(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Function to display menu and retrieve user choice
local function display_menu()
    local menu_options = "  Power Off\n  Restart\n  Suspend\n󰗽  Log Out\n󰷛  Lock"
    local chosen = execute_command(string.format("echo '%s' | rofi -dmenu -config %s -i -p 'Power Menu:'", menu_options, RASI))
    return chosen:gsub("\n", "")  -- Remove newline character
end

-- Main logic
local chosen = display_menu()

if chosen == "  Power Off" then
    execute_command("poweroff")
elseif chosen == "  Restart" then
    execute_command("reboot")
elseif chosen == "  Suspend" then
    execute_command("systemctl suspend")
elseif chosen == "󰗽  Log Out" then
    execute_command("bspc quit")
elseif chosen == "󰷛  Lock" then
    execute_command("betterlockscreen -l")
else
    os.exit(1)
end
