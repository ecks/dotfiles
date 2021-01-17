#!/usr/bin/env bash

# emulates i3 behaviour where
# if you press the button for the tag
# you are on, you will goto previous 
# tag you were on. It is different from
# lasttag.sh in that it does not need to be started 
# ahead of time.

. ~/.hlwm

dst=$1
focused=$(herbstclient attr tags.focus.index)

if [[ $dst == "$focused" ]]; then
    hc use_previous
else
    hc use_index "$1"
fi
