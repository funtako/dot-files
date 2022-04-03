#!/bin/bash
#TODO: youtube dl like in your yta alias but if it gets the error then wait 5 seconds and try again and log 
# log everything somewhere have an option to manually skip the error repeating by pressing a key echo that message 
# because sometimes if im on a different IP you cant get the video in some locations
#then also let it work in a loop from a list of video links in a text document

VIDEO_LINK=
#TODO: I WANT TO TO OUTPUT THE DOWNLAODING TO THE CONSOLE INSTEAD OF waiting until it finishes the download to do it
if  youtube-dl --extract-audio --audio-format mp3 "$VIDEO_LINK" | grep -q 'Error 403'; then
    echo "%title  failed to download"
else
    echo "%title sucessfully downloaded"
fi

#yt %                                                                                                                 [daniel@debian ~]$ yta 'https://www.youtube.com/watch?v=zf2VYAtqRe0' 
#[youtube] zf2VYAtqRe0: Downloading webpage 
#ERROR: unable to download video data: HTTP Error 403: Forbidden 
#
