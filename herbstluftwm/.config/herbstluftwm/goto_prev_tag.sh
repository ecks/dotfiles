#!/usr/bin/env bash

dst=$1
focused=$(herbstclient attr tags.focus.index)

if [[ $dst == "$focused" ]]; then
    herbstclient use_previous
else
    herbstclient use_index "$1"
fi
