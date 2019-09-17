#!/bin/bash

function bright(){
	read bright < /sys/class/backlight/acpi_video0/brightness
	echo $((bright-(1))) | sudo tee /sys/class/backlight/acpi_video0/brightness
}

DIR=$( cd "$( dirname "$0" )" && pwd )   		# get script dir
if [ "$UID" -ne 0 ]; then                		# check if you are root
    	Password="UserPassword"
	echo $Password |sudo -S $DIR/bright_down.sh	# NOT: run script with sudo
else
    bright                                  		# YES: run function
fi
