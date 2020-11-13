#!/bin/bash

function bright(){
	read bright < /sys/class/backlight/acpi_video0/brightness
	echo $((bright-(1))) | sudo tee /sys/class/backlight/acpi_video0/brightness
}

DIR=$( cd "$( dirname "$0" )" && pwd )   		# get script's dir
Password="UserPassword"					# password of user

if [ "$UID" -ne 0 ]; then                		# check if you are root

	echo $Password |sudo -S $DIR/bright_down.sh	# run script with sudo
else
    bright                                  		# run function
fi
