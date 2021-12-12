#!/bin/bash

disk="$(df -h | grep /dev/sda1 | awk '{print $3, $5}')"

echo $disk
