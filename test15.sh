#!/bin/sh

function diskspace
{
    clear 
    df -k
}

function whoseon
{
    clear
    who
}

function memusage
{
    clear
    cat /proc/meminfo
}


function menu 
{
    clear
    echo
    echo -e "\t\t\t\t\tSys Admin Menu\n"
    echo -e "\t\t\t1. Display disk space"
    echo -e "\t\t\t2. Display logged on users"
    echo -e "\t\t\t3. Display memory usage"
    echo -e "\t\t\t0. Exit Menu\n\n"
    echo -e "\t\t\t\tEnter your option: "
    read -n 1 option
}

while [ 1 ]
do 
    menu
    case $option in 
        0) 
            break;;
        1)
            diskspace;;
        2)
            whoseon;;
        3)
            memusage;;
        *)
            clear
            echo "Sorry, wrong option!";;   
    esac
    echo -en "\n\n\t\t\t\t\tHit any key to continue"
    read -n 1 line
done
clear