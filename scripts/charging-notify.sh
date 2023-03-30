#!/bin/sh

export XAUTHORITY=/home/empyrean/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

BATTERY_CHARGING=$1
BATTERY_LEVEL=`acpi -b | grep -P -o '[0-9]+(?=%)'`

if [ $BATTERY_CHARGING -eq 1 ]; then
  /usr/bin/notify-send "Charging" "${BATTERY_LEVEL}% of battery charged."
elif [ $BATTERY_CHARGING -eq 0 ]; then
  /usr/bin/notify-send "Discharging" "${BATTERY_LEVEL}% of battey remaining."
fi
