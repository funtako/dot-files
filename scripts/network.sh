#!/bin/bash
# require nerdfont
hostname="${HOSTNAME:-${hostname:-$(hostname)}}"

network() {
    wire="$(ip a | grep enp0 | grep NO-CARRIER | wc -l)"
#    wifi="$(ip a | grep wlan | grep inet | wc -l)"
    wifi="$(ip a | grep wlp | grep inet | wc -l)"

if [ $wire = 0 ]; then 
    echo "  $(hostname -I | awk '{print $1}')" #nf-mdi-ethernet
elif [ $wifi = 1 ]; then
    echo "直  $(hostname -I | awk '{print $1}')" #nf-mdi-wifi
else 
    echo "睊" #nf-mdi-wifi_off #nf-fa-exclamation
fi
}

vpn() {
        state="$(ip a | grep tun0 | grep inet | wc -l)"
            
if [ $state = 1 ]; then
    echo "ﱾ"
else
    echo " "
fi
}

echo "$(network)$(vpn)" 


