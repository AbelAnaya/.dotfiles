#!/bin/bash

function main() {
    # Pipewire
    SOURCE=$(pw-record --list-targets | sed -n 's/^*.*"\(.*\)" prio=.*$/\1/p')
    IS_MUTED=$(pactl list sources | sed -n "/${SOURCE}/,/Mute/ s/Mute: \(yes\)/\1/p")

    action=$1
    if [ "${action}" == "mute" ]; then
        pactl set-source-mute @DEFAULT_SOURCE@ toggle
    else
        if [ "${IS_MUTED}" != "" ]; then
            echo " "
        else
            echo " "
        fi
    fi
}

main $@
