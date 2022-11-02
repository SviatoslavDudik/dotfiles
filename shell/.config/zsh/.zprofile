#!/bin/sh

export PATH=$PATH:$HOME/bin
export TERMINAL=kitty
export BROWSER=firefox
export MAIL="$HOME/Mail"
export VISUAL=vim
export EDITOR=vim
export TERM=screen-256color
export GDK_BACKEND=x11

if [[ ! $DISPLAY ]]; then
	case $XDG_VTNR in
		1) exec startx ;;
		2) exec startx /usr/bin/startplasma-x11 ;;
	esac
fi

if [ -f "${HOME}/.gpg-agent-info" ]; then
	source "${HOME}/.gpg-agent-info"
		export GPG_AGENT_INFO
		export SSH_AUTH_SOCK
		export SSH_AGENT_PID
else
	eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
fi

