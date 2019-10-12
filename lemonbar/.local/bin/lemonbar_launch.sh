#!/bin/bash

# Terminate already running bar instances
killall -q lemonbar

# Wait until the processes have been shut down
while pgrep -u $UID -x lemonbar >/dev/null; do sleep 1; done

# Launch Lemonbar
BARPYRUS_CONFIG=~/.config/barpyrus/config_i3.py barpyrus &
#~/scripts/lemonbar.sh | lemonbar -p -b &
