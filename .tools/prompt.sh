#!/bin/zsh

[ $(echo "No\nYes" | dmenu -i -p "$1") = "Yes" ] && zsh -c "$2"
