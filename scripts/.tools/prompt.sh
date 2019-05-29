#!/bin/zsh

[ $(echo "No\nYes" | dmenu -i -p "$1") = "Yes" ] && sh -c "$2"
