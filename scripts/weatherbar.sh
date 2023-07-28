#!/bin/bash

temp=$(cat ~/.config/weather.txt | grep temp_C | awk '{print $2}' | sed 's/,//' | sed 's/\"//g')
weather=$(cat ~/.config/weather.txt | grep value | awk '{print $2 $3}' | sed 's/\"//g')

echo $temp $weather
