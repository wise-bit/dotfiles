#!/bin/bash

# Get monitor list
monitors=($(hyprctl monitors -j | jq -r '.[].name'))

# Get focused window's monitor
current_monitor=$(hyprctl activewindow -j | jq -r '.monitor')

# Find index of current monitor
# for i in "${!monitors[@]}"; do
#   if [[ "${monitors[$i]}" == "$current_monitor" ]]; then
#     current_index=$i
#     echo "$i"
#     break
#   fi
# done

current_index=$current_monitor

# Calculate next monitor index cyclically
next_index=$(( (current_index + 1) % ${#monitors[@]} ))

next_monitor="${monitors[$next_index]}"
# next_monitor=$next_index
echo $next_monitor

# Move window to next monitor
hyprctl dispatch movetomonitor "$next_monitor"

