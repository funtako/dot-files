#!/bin/sh


#get a random number between 1 and the value you choose in $1
randomNumberTo() {
    #using shuf from GNU coreutils
    number=$(shuf -i 1-$1 -n 1)
    echo $number
}


#the ascii art is named 1.txt 2.txt etc so get a random ascii and cat it out
#$TOTAL_ASCII_NUMBER is set in zprofile which is the total number of files in the folder where the ascii art is in
cat "$ASCII_IMAGES_DIR/$(randomNumberTo $TOTAL_ASCII_NUMBER).txt"
