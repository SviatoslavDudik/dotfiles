#!/bin/sh

userresources=$XDG_CONFIG_HOME/X11/xresources
usermodmap=$XDG_CONFIG_HOME/X11/keymaps
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge $userresources
fi

if [ -f "$usermodmap" ]; then
    xmodmap $usermodmap
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set up an icon tray
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
	--expand true --width 5 --transparent true --alpha 0 --tint 0x282c34 \
	--height &

# Set the default X cursor to the usual pointer
xsetroot -cursor_name left_ptr

# Set a nice background
feh --bg-fill --no-fehbg ~/Pictures/x220.png

if [ -f /home/archie/.local/bin/xmonad ]; then
	session=${1:-xmonad}
else
	session=${1:-dwm}
fi


case "$session" in
	i3|i3wm) exec /usr/bin/i3 ;;
	dwm) exec /usr/local/bin/dwm ;;
	xmonad) exec /home/archie/.local/bin/xmonad ;;
	kde) exec /usr/bin/startplasma-x11 ;;
	*) exec $1 ;;
esac
