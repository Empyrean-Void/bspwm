#!/usr/bin/env bash

logfile=$1

declare -a MSGBUF
STATE=off
MSGTIME=

printbuf() {
  JOINED=$(printf "%s\n" "${MSGBUF[@]}")
  printf "%s\n%s\n" "--- ${MSGTIME} ---" "${JOINED}"
}

procmsg() {
  if [[ "${1}" =~ member=Notify$ ]]; then
    STATE=on
    MSGTIME=$(date '+%Y-%m-%d %H:%M:%S')
    MSGBUF=()
  elif [[ "${1}" =~ member=NotificationClosed$ ]]; then
    STATE=off
    printbuf >> "$logfile"
  else
    if [[ "${STATE}" == "on" ]]; then
      if [[ "${1}" =~ ^string ]]; then
        case "${1}" in
          "string \"\"") ;;
          "string \"urgency\"") ;;
          "string \"sender-pid\"") ;;
          *)
            STR=$(echo "${1}" | sed 's/^string "\(.*\)"$/\1/')
            MSGBUF+=("${STR}")
            ;;
        esac
      fi
    fi
  fi
}

dbus-monitor "interface='org.freedesktop.Notifications'" |
  while read -r line; do
    procmsg "$line"
  done
