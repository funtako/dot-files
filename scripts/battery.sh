#!/bin/bash
# icons depend on nerdfonts being installed
 bat() {
batstat="$(cat /sys/devices/platform/smapi/BAT0/state)"
#batstat="$(cat /sys/class/power_supply/BAT0/status)"
#battery="$(cat cat /sys/class/power_supply/BAT0/capacity)"
battery="$(cat /sys/devices/platform/smapi/BAT0/remaining_percent)"
timeleft="$(cat /sys/devices/platform/smapi/BAT0/remaining_running_time)"


#this if statement is if you have the thinkpad swapi stuff installed
if [[ $batstat = 'Unknown' ]]; then
	    batemoji="" #nf-mdi-battery_unknown
elif [[ $battery -ge 0 ]] && [[ $battery -le 4 ]]; then
	    batemoji="" #nf-mdi-battery_alert
elif [[ $battery -ge 5 ]] && [[ $battery -le 9 ]]; then
	    batemoji="" #nf-mdi-battery_outline
elif [[ $battery -ge 10 ]] && [[ $battery -le 14 ]]; then
	    batemoji="" #nf-mdi-battery_10
elif [[ $battery -ge 15 ]] && [[ $battery -le 24 ]]; then
	    batemoji="" #nf-mdi-battery_20
elif [[ $battery -ge 25 ]] && [[ $battery -le 34 ]]; then
	    batemoji="" #nf-mdi-battery_30
elif [[ $battery -ge 35 ]] && [[ $battery -le 44 ]]; then
	    batemoji="" #nf-mdi-battery_40
elif [[ $battery -ge 45 ]] && [[ $battery -le 54 ]]; then
	    batemoji="" #nf-mdi-battery_50
elif [[ $battery -ge 55 ]] && [[ $battery -le 64 ]]; then
	    batemoji="" #nf-mdi-battery_60
elif [[ $battery -ge 65 ]] && [[ $battery -le 74 ]]; then
	    batemoji="" #nf-mdi-battery_70
elif [[ $battery -ge 75 ]] && [[ $battery -le 84 ]]; then
	    batemoji="" #nf-mdi-battery_80
elif [[ $battery -ge 85 ]] && [[ $battery -le 94 ]]; then
	    batemoji="" #nf-mdi-battery_90
elif [[ $battery -ge 95 ]] && [[ $battery -le 100 ]]; then
	    batemoji="" #nf-fa-battery-full
fi


if [[ $battery -ge 0 ]] && [[ $battery -le 24 ]] && [[ $batstat = 'charging' || $batstat = 'idle' ]]; then
	    batemoji="" #nf-mdi-battery_charging_20
elif [[ $battery -ge 25 ]] && [[ $battery -le 34 ]] && [[ $batstat = 'charging' || $batstat = 'idle' ]]; then
	    batemoji="" #nf-mdi-battery_charging_30
elif [[ $battery -ge 35 ]] && [[ $battery -le 44 ]] && [[ $batstat = 'charging' || $batstat = 'idle' ]]; then
	    batemoji="" #nf-mdi-battery_charging_40
elif [[ $battery -ge 45 ]] && [[ $battery -le 64 ]] && [[ $batstat = 'charging' || $batstat = 'idle' ]]; then
	    batemoji="" #nf-mdi-battery_charging_60
elif [[ $battery -ge 65 ]] && [[ $battery -le 84 ]] && [[ $batstat = 'charging' || $batstat = 'idle' ]]; then
            batemoji="" #nf-mdi-battery_charging_80
elif [[ $battery -ge 85 ]] && [[ $battery -le 94 ]] && [[ $batstat = 'charging' || $batstat = 'idle' ]]; then
	    batemoji="" #nf-mdi-battery_charging_90
elif [[ $battery -ge 95 ]] && [[ $battery -le 100 ]] && [[ $batstat = 'charging' || $batstat = 'idle' ]]; then

	    batemoji="" #nf-mdi-battery_charging_100
fi

if [[ $timeleft = 'not_discharging' ]]; then
	timeleft='ﯢ'
fi
#    echo "$batstat $battery % $timeleft m"
    echo "$batemoji $timeleft m"

}
echo "$(bat)" 

