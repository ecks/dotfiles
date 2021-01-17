#!/usr/bin/env bash

. ~/.hlwm

is_ultrasplit() {
    hc silent get_attr my_ultrasplit 2>/dev/null
}

ultrawide=$(hc detect_monitors -l | grep "3440x1440" | wc -l)
Mod=Mod4   # Use the super key as the main modifier

if is_ultrasplit && [[ $ultrawide == "1" ]]; then

    # in ultrasplit mode, split screen and register F3 to remove the ultrasplit
    hc set_monitors $(herbstclient disjoin_rects 1720x1440+0+0 1720x1440+1720+0 1920x1080+3440+0)
    hc keybind $Mod-F3 chain , remove_attr my_ultrasplit , reload
else
    # not in ultrasplit mode, just regular screen and register F3 to ultrasplit
    hc detect_monitors
    hc keybind $Mod-F3 chain , new_attr bool my_ultrasplit true , reload
fi
