#!/bin/bash

output=$HOME/pictures/screenshots/"$(date +%s_%y%h%d_%H%M%S).png"

maim  "$output"

notify-send "Maim Screenshot Taken"
