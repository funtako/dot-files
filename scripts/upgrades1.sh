#!/bin/bash
#need nerd fonts
upgrades="$(aptitude search '~U' | wc -l)"
echo "  $upgrades" > ~/.config/upgradesneeded.txt #nf-fa-arrow_circle_up 

