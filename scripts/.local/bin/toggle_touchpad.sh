#!/bin/bash

device="SynPS/2 Synaptics TouchPad"
enabled=$(xinput list-props "SynPS/2 Synaptics TouchPad" | grep 'Device Enabled' | awk '{print $NF}')

if [ "$enabled" == "1" ]; then
	xinput --disable "$device"
else
	xinput --enable "$device"
fi

