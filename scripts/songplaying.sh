#!/bin/bash
#ubuntu nerdfonts from https://www.nerdfonts.com/cheat-sheet 
status=$(playerctl status)
artist=$(playerctl metadata artist)
title=$(playerctl metadata title)
shortertitle=$(echo $title | cut -c 1-20) # just take the first N many characters from the title

if [[ $status = 'Playing' ]]; then
	statmoji= #nf-fa-play_circle
elif [[ $status = 'Paused' ]]; then 
	statmoji= #nf-fa-pause_circle
fi

echo $statmoji $artist - $shortertitle

