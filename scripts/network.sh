#!/bin/bash
# require nerdfont
hostname="${HOSTNAME:-${hostname:-$(hostname)}}"

network() {
    wire="$(ip a | grep enp0 | grep NO-CARRIER | wc -l)"
#    wifi="$(ip a | grep wlan | grep inet | wc -l)"
    wifi="$(ip a | grep wlp | grep inet | wc -l)"

if [ $wire = 0 ]; then 
    echo " " #nf-mdi-ethernet
elif [ $wifi = 1 ]; then
    echo "直" #nf-mdi-wifi
else 
    echo "睊" #nf-mdi-wifi_off #nf-fa-exclamation
fi
}

vpn() {
        vpnstate="$(ip a | grep wg-mullvad | grep inet | wc -l)"
        vpnstatetun="$(ip a | grep tun0 | grep inet | wc -l)"
        vpnip="$(mullvad status | awk -F : '{print $2}' | awk '{print $4}')"
            
if [ $vpnstate = 1 ] || [ $vpnstatetun = 1 ]; then
    echo "ﱾ" $vpnip #nf-mdi-shield_half_full #nf-mdi-emoticon_cool
else
    echo ""
fi
}




echo "$(network)$(vpn)" 


