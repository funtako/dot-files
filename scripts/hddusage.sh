#!/bin/sh
#require ubuntu nerd fonts
hdd="$(df -h /home | grep dev | awk '{print$3, " "  $5}')"
echo "  $hdd" #nf-fa-save

