#!/bin/bash
function uploadImage {
    curl -s -F "image=@$1" -F "key=486690f872c678126a2c09a9e196ce1b" https://imgur.com/api/upload.xml | grep -E -o "<original_image>(.)*</original_image>" | grep -E -o "http://i.imgur.com/[^<]*"
}
sleep 0.2
scrot -s "/tmp/shot.png"
uploadImage "/tmp/shot.png" | xclip -selection clipboard
notify-send --icon="accessories-camera" "Scrotted to imgur" "You can paste the link now"
if [ -f /tmp/shot.png ]
then
    rm "/tmp/shot.png"
fi
# binded to Super+i by default
