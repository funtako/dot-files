#!/bin/sh

#slstatus &
#sxhkd &
#compton &
#redshift &
#mpDris2 &
#mpd &
#dunst &  #lets you use notify-send notifications
#setxkbmap -option caps:swapescape
#nitrogen --restore &

[ -f $HOME/.xprofile ] && . $HOME/.xprofile 

dwm
