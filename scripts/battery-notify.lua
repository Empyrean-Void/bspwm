#!/usr/bin/env lua

-- Required modules
local io = require("io")

-- Set environment variables
os.setenv("DISPLAY", ":0")
os.setenv("DBUS_SESSION_BUS_ADDRESS", "unix:path=/run/user/1000/bus")

-- Battery percentage at which to notify
local WARNING_LEVEL = 25
local BATTERY_DISCHARGING = tonumber(io.popen("acpi -b | grep -c 'Discharging'"):read("*n"))
local BATTERY_LEVEL = tonumber(io.popen("acpi -b | grep -P -o '[0-9]+(?=%)'"):read("*n"))
local POLL_INTERVAL = 120

-- Use two files to store if notification was sent
local EMPTY_FILE = "/tmp/batteryempty"
local FULL_FILE = "/tmp/batteryfull"

-- Reset notifications if battery is charging/discharging
if BATTERY_DISCHARGING == 1 and io.open(FULL_FILE) then
  os.remove(FULL_FILE)
elseif BATTERY_DISCHARGING == 0 and io.open(EMPTY_FILE) then
  os.remove(EMPTY_FILE)
end

-- If battery is full and charging (notification not shown)
if BATTERY_LEVEL > 99 and BATTERY_DISCHARGING == 0 and not io.open(FULL_FILE) then
  os.execute("notify-send 'Battery Charged' 'Battery is fully charged.'")
  io.open(FULL_FILE, "w"):close()
-- If battery is low and discharging (notification not shown)
elseif BATTERY_LEVEL <= WARNING_LEVEL and BATTERY_DISCHARGING == 1 and not io.open(EMPTY_FILE) then
  os.execute(string.format("notify-send 'Low Battery' '%d%% of battery remaining' -u critical", BATTERY_LEVEL))
  io.open(EMPTY_FILE, "w"):close()
end

os.execute("sleep " .. POLL_INTERVAL)
