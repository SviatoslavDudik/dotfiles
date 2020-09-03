#!/bin/sh
[ -x /usr/local/bin/slstatus ] && /usr/local/bin/slstatus&
[ -x $HOME/.local/bin/presleep ] && xss-lock $HOME/.local/bin/presleep&
[ -x /usr/bin/xbindkeys ] && /usr/bin/xbindkeys -f "$XDG_CONFIG_HOME"/xbindkeys/config
xmodmap $XDG_CONFIG_HOME/X11/keymaps
/usr/local/bin/trackpoint
