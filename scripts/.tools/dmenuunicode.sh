#!/bin/zsh

chosen=$(grep -v '#' ~/.emoji | dmenu -i -l 10 -fn Monospace-14 | awk '{printf $1}'| sed "s/ .*//")

# If nothing has been chosen then exit
[ "$chosen" != "" ] || exit

# Else copy to clipboard and send notification
echo "$chosen" | tr -d '\n' | xclip -selection c
notify-send "'$chosen' copied to clipboard"
