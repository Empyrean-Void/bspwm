#!/usr/bin/env bash

logfile=$1

dbus-monitor "interface='org.freedesktop.Notifications'" |\
grep --line-buffered "string" |\
grep --line-buffered -e method -e ":" -e '""' -e urgency -e notify -v |\
grep --line-buffered '.*(?=string)|(?<=string).*' -oPi |\
xargs -I '{}' \
printf "---$( date )---\n---"{}"\n" >> $logfile
