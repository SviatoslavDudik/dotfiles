#!/bin/sh

[ $(echo -e "No\nYes" | dmenu -i -p "$1") = "Yes" ] && sh -c "$2"
