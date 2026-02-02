#!/bin/bash
# Makes a "zen mode" which hides waybar. Script is run via a keybind mapped in hyprland.conf

STATE_FILE="/tmp/hypr_zen_mode"

if [ ! -f $STATE_FILE ]; then
    # --- ENTER ZEN MODE ---
    touch $STATE_FILE
    pkill -USR1 waybar || pkill waybar
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword general:border_size 0
else
    # --- EXIT ZEN MODE ---
    rm $STATE_FILE
    # Try to unhide; if Waybar isn't running at all, start it
    pkill -USR1 waybar || waybar & 
    hyprctl reload
fi
