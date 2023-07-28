#downloaded some smapi thing from thinkpad drivers that allow you to set the max percent charging to 80% then i can get the status from there instead.
bat() {
	batstat="$(cat /sys/devices/platform/smapi/BAT0/state)"
#batstat="$(cat /sys/class/power_supply/BAT0/status)"
#battery="$(cat cat /sys/class/power_supply/BAT0/capacity)"
	battery="$(cat /sys/devices/platform/smapi/BAT0/remaining_percent)"
	timeleft="$(cat /sys/devices/platform/smapi/BAT0/remaining_running_time)"

    #this if statement is if you have the thinkpad swapi stuff installed
	  if [[ $batstat = 'Unknown' ]]; then
 	    batemoji="" #questionmark
        elif [[ $batstat = 'charging' ]] || [[ $batstat = 'idle' ]]; then
        batemoji="" #charging-station
  	    elif [[ $battery -ge 0 ]] && [[ $battery -le 8 ]]; then
   	    batemoji="" #battery-empty
  	    elif [[ $battery -ge 10 ]] && [[ $battery -le 19 ]]; then
   	    batemoji="" #battery-quarter
	    elif [[ $battery -ge 20 ]] && [[ $battery -le 44 ]]; then
        batemoji="" #battery-half
   	    elif [[ $battery -ge 45 ]] && [[ $battery -le 69 ]]; then
  	    batemoji="" #battery-three-quarters
   	    elif [[ $battery -ge 70 ]] && [[ $battery -le 100 ]]; then
   	    batemoji="" #battery-full
	    fi
#	echo "$batstat $battery % $timeleft m"
	echo "$batemoji"
}

echo "$(bat)"
