#!/bin/sh

export PATH="$PATH:~/bin:~/.tools"
export TERMINAL=gnome-terminal
export BROWSER=firefox
export MAIL="$HOME/Mail"
export VISUAL=vim
export EDITOR=vim
export TERM=screen-256color
export GDK_BACKEND=x11

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

