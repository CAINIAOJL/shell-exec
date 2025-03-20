#!/bin/bash

#GUI kdialog menu

temp1=$(mktemp -t temp1.XXXXXXXXX)
temp2=$(mktemp -t temp2.XXXXXXXXX)

function diskspace {
    df -k >$temp1
    kdialog --textbox $temp1 1000 10
}

function whoseon {
    who >$temp1
    kdialog --textbox $temp1 500 10
}

function memusage {
    cat /proc/meminfo >$temp1
    kdialog --textbox $temp1 300 500
}

while [ 1 ]
do
    kdialog --menu "Sys Admin Menu" "1" "Display disk space" "2" "Display users" "3" "Display memory usage" "0" "Exit" >$temp2

    if [ $? -eq 1 ]; then
        break
    fi

    selection=$(cat $temp2)
    case $selection in 
        1) diskspace;;
        2) whoseon;;
        3) memusage;;
        0) break;;
        *) kdialog --msgbox "Sorry, Invalid selection"
    esac
done