#!/bin/bash
#requires ubuntu nerd fonts
mem="$(free -h | awk '/Mem:/ {printf $3 " / " $2}')"
echo "  $mem" #nf-fa-server
