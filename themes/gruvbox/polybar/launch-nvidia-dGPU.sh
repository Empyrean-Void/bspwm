#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar (dGPU)
polybar main -c ~/.config/bspwm/themes/gruvbox/polybar/configs/config-nvidia-dGPU.ini & 2>&1 | tee -a /tmp/polybar.log & disown
polybar laptop -c ~/.config/bspwm/themes/gruvbox/polybar/configs/config-nvidia-dGPU.ini & 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
