#!/bin/sh

echo "__________________________"
date

#ram usage
echo RAM
free -h
echo "__________________________"
#cpu usage
cpu_idle=$(top -b -n 1 | grep Cpu | awk '{print $8}' |cut -f 1 -d ".")
cpu_use=$(expr 100 - $cpu_idle)

# CPU AND hard drive usage
echo "CPU $cpu_use % |  " $(df -h | grep -w /dev/sda1 | awk '{print $5 " Hard Drive " $3" / " $4}' )

echo "\n"
