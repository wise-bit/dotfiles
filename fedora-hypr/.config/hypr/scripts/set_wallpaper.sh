#!/bin/zsh
WALLPAPER="$HOME/pictures/snoopy1.jpg"
for mon in $(hyprctl monitors -j | jq -r '.[].name'); do
  swww img "$WALLPAPER" --transition-type fade --transition-duration 1 --outputs "$mon"
done

