#!/bin/zsh

# Choose partition to mount
part=$(lsblk -l | sed '1d' | grep -v "/\|disk" | awk '{printf $1 " " $4 "\n"}' | dmenu | sed 's/ .*//g')

# Check if the partition is valid
[ $(lsblk -l | sed '1d' | grep -v "/\|disk" | awk '{printf $1}' | grep $part | wc -l) -eq 1 ] || exit -1

# Mount and send notification
mkdir -p /mnt/$part && \
	mount -o uid=1000 /dev/$part /mnt/$part && \
	sudo -u archie DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send 'System' "$part succesfully mounted at /mnt/$part"
