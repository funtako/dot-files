#!/bin/bash

#using nerd fonts
VOLONOFF="$(amixer -D pulse get Master | grep Left: | sed 's/[][]//g' | awk '{print $6}')"
VOL="$(amixer -D pulse get Master | grep Left: | sed 's/[][]//g' | sed 's/%//g'|  awk '{print $5}')"

MUTEICON="婢" #nf-mdi-volume_off
VOL_HIGH="墳" #nf-mdi-volume_high
VOL_LOW="奄" #nf-mdi-volume_low
VOL_MED="奔" #nf-mdi-volume_medium


if [ "$VOLONOFF" = "on" ]; then

if [ "$VOL" -ge  60 ]; then
    echo "$VOL_HIGH $VOL%"
elif [ "$VOL" -gt  0 ] && [ "$VOL" -lt 60 ]; then
    echo "$VOL_MED $VOL%"
elif [ "$VOL" -ge  0 ]; then
    echo "$VOL_LOW $VOL%"
fi

else
        echo "$MUTEICON"
fi

