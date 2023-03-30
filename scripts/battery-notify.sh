#!/bin/sh

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Battery percentage at which to notify
WARNING_LEVEL=25
BATTERY_DISCHARGING=`acpi -b | grep -c "Discharging"`
BATTERY_LEVEL=`acpi -b | grep -P -o '[0-9]+(?=%)'`
POLL_INTERVAL=120

# Use two files to store if notification was sent
EMPTY_FILE=/tmp/batteryempty
FULL_FILE=/tmp/batteryfull

# Reset notifications if battery is charging/discharging
if [ $BATTERY_DISCHARGING -eq 1 ] && [ -f $FULL_FILE ]; then
  rm $FULL_FILE
elif [ $BATTERY_DISCHARGING -eq 0 ] && [ -f $EMPTY_FILE ]; then
  rm $EMPTY_FILE
fi

# If battery is full and charging (notification not shown)
if [ $BATTERY_LEVEL -gt 99 ] && [ $BATTERY_DISCHARGING -eq 0 ] && [ ! -f $FULL_FILE ]; then
  notify-send "Battery Charged" "Battery is fully charged."
  touch $FULL_FILE
# If battery is low and discharging ( notification not shown)
elif [ $BATTERY_LEVEL -le $WARNING_LEVEL ] && [ $BATTERY_DISCHARGING -eq 1 ] && [ ! -f $EMPTY_FILE ]; then
  notify-send "Low Battery" "${BATTERY_LEVEL}% of battery remaining" -u critical
  touch $EMPTY_FILE
fi

sleep $POLL_INTERVAL
