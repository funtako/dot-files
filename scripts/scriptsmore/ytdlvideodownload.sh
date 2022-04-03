#!/bin/sh

echo "Video would be 360p"
read -p 'video link?' videolink

directory=$HOME/Videos/ytdlwatchlater
videoname='%(title)s by %(uploader)s.%(ext)s'
if [ ! -d "$directory" ]; then
    mkdir -p $directory
fi


while true; do
    read -p 'Do you only want the audio?' wantAudio
    case $wantAudio in 
        [Yy]* ) youtube-dl -o "$directory/$videoname" --extract-audio "$videolink" ; break;;
#Download best format available but not better that 
        [Nn]* ) youtube-dl -o "$directory/$videoname" --add-metadata --embed-subs --all-subs -f 'bestvideo[height<=360]+bestaudio/best[height<=360]' "$videolink" ; break;;
#the f number might not be available for the video you want to download if it is you will need to run youtube-dl -F video url then see which numbers are available. 
       # [Nn]* ) youtube-dl -o "$directory/$videoname" --add-metadata --embed-subs --all-subs -f 134+250 "$videolink" ;;
        * ) echo "Please answer yes or no.";;
    esac
done




