#!/bin/bash
#GUI menu
function diskspace {
    clear
    df -k
}

function whoseon {
    clear
    who
}

function memusage {
    clear
    cat /proc/meminfo
}

ps3="Enter option"
select option in "Display disk space" "Display logged on users" "Display memory usage" "Exit program"
do 
    case $option in 
        "Exit program")
            break;;
        "Display disk space")
            diskspace;;
        "Display logged on users")
            whoseon;;
        "Display memory usage")
            memusage;;
        *) 
            clear
            echo "Sorry, Wrong option selected.";;
    esac
done
clear