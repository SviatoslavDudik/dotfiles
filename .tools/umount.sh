#!/bin/zsh

# Choose partition to unmount
part=$(lsblk -l | sed '1d' | grep -v "sda5\|sda2" | grep / | awk '{printf $1 " " $4 "\n"}' | dmenu | sed 's/ .*//g')

# Check if the partition is valid
[ $(lsblk -l | sed '1d' | grep -v "sda5\|sda2" | awk '{printf $1}' | grep $part | wc -l) -eq 1 ] || exit -1

# Get the mountpoint
mountpoint=$(lsblk -l | grep $part | awk '{print $7}')

# Unmount and send notification
sync && \
	umount $mountpoint && \
	rmdir $mountpoint && \
	sudo -u archie DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send 'System' "$part succesfully unmounted from $mountpoint"


