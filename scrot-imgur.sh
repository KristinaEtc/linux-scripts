#!/bin/bash

sleep 0.2
scrot -s "shot.png" 
imgur.sh "shot.png" 
if [ "$?" -ne 0 ]
    then
    notify-send "Fail :("
	rm "shot.png"
    exit 1                
fi
rm "shot.png"
notify-send IMGUR "Done"
# binded to Super+i by default
