#/bin/sh

man -Tpdf `man -k . | dmenu -i -l 10 | awk '{printf $2 $1}' | sed 's/[()]/ /g'` > /tmp/man.pdf && zathura -P 1 --mode fullscreen /tmp/man.pdf; rm /tmp/man.pdf
