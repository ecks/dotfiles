#!/bin/bash

# shell scipt to prepend i3status with more stuff
# https://docs.slackware.com/howtos:window_managers:keyboard_layout_in_i3#displaying_the_active_layout_in_the_panel
i3status --config ~/.config/i3status/config | while :
do
        read line
        KB=$(xkblayout-state print "%e" | cut -c -2) 
        st=""
        if [ $KB == "us" ]
        then
            st="[{ \"full_text\": \"$KB\", \"color\":\"#009E00\" }," # green
        else
            st="[{ \"full_text\": \"$KB\", \"color\":\"#C60101\" }," # red
        fi
        # http://tldp.org/LDP/abs/html/string-manipulation.html -- Substring Replacement
        echo "${line/[/$st}" || exit 1
done
