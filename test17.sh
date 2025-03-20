#!/bin/bash

#GUI Menu dialog

temp1=$(mktemp -t test1.XXXXXX)
temp2=$(mktemp -t test2.XXXXXX)

function diskspace {
    df -k > $temp1
    dialog --textbox $temp1 20 60
}

function whoseon {
    who > $temp2
    dialog --textbox $temp2 20 50
}

function memusage {
    cat /proc/meminfo > $temp1
    dialog --textbox $temp1 20 50
}

while [ 1 ]
do 
    dialog --menu "Sys Admin Menu" 20 30 10 1 "Display disk space" 2 "Display users" 3 "Display memory usage" 0 "Exit" 2> $temp2
    #判断退出码
    if [ $? -eq 1 ]; then
        break
    fi

    selection=$(cat $temp2)
    case $selection in 
        1) 
            diskspace;;
        2)
            whoseon;;
        3)
            memusage;;
        0)
            break;;
        *)
        dialog --msgbox "Sorry, invalid option selection." 10 30
    esac
done    

rm -rf $temp1 > /dev/null
rm -rf $temp2 > /dev/null
