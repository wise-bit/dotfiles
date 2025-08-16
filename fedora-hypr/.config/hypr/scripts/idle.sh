#!/bin/bash

swayidle -w \
    timeout 300 "~/.config/hypr/scripts/idle_check.sh hyprctl dispatch dpms off" \
    resume      "hyprctl dispatch dpms on" \
    timeout 320 "hyprctl dispatch dpms on && ~/.config/hypr/scripts/idle_check.sh ~/.config/hypr/scripts/lock.sh"
