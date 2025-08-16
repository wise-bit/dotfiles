#!/bin/sh
# Dual monitor setup: external + laptop side by side

hyprctl keyword monitor "eDP-1,1920x1200@60,0x0,1.0"
hyprctl keyword monitor "DP-6,2560x1440@60,1920x0,1.0"
