#!/bin/bash

#GUI dialog menu sql

temp=$(mktemp -t record.XXXXXXXXXX)
datafile="data.txt"
newrecordfile="newrecored.sql"

function newrecord {
    dialog --form "Enter new employee" 19 50 0 \
    "Last name " 1 1 "" 1 15 30 0 \
    "First name " 3 1 "" 3 15 30 0 \
    "Address " 5 1 "" 5 15 30 0 \
    "City " 7 1 "" 7 15 30 0 \
    "State " 9 1 "" 9 15 30 0 \
    "Zip " 11 1 "" 11 15 30 0 2>$temp

    if [ $? -eq 0 ]; then
        # 显示第一行
        last=$(cat $temp | head -1)
        # 显示二行中的最后一行
        first=$(cat $temp | head -2 | tail -1)
        # 显示三行中的最后一行
        address=$(cat $temp | head -3 | tail -1)
        city=$(cat $temp | head -4 | tail -1)
        state=$(cat $temp | head -5 | tail -1)
        zip=$(cat $temp | head -6 | tail -1)

        record="INSERT INTO employees (last, first, address, city, state, zip) VALUES ('$last', '$first', '$address', '$city', '$state', '$zip');"
        echo "$last"",""$first"",""$address"",""$city"",""$state"",""$zip" >> $datafile
        echo "$record" >> $newrecordfile
    fi
}

function listrecords {
    dialog --title "New Data" --textbox $datafile 20 50
}

function createrecordfromtext {
    OLD_IFS=$IFS
    IFS=','

    cat $datafile | while read -r lname fname address city state zip
    do 
        record="INSERT INTO employees (last, first, address, city, state, zip) VALUES ('$lname', '$name', '$address', '$city', '$state', '$zip');"
        echo "$record" >> $newrecordfile
    done
    $IFS=$OLD_IFS
    dialog --msgbox "Create all records(sql) from text" 10 30
}


while [ 1 ]
do 
    #  --menu         <text> <height> <width> <menu height> <tag1> <item1>...
    dialog --menu "Employee Data" 20 30 5 \
    1 "Enter new employee" \
    2 "Display records" \
    3 "Exit" 2>$temp \
    4 "create all records from text"

    if [ $? -eq 1 ]; then
        break
    fi

    selection=$(cat $temp)
    case $selection in 
        1) 
            newrecord;;
        2)
            listrecords;;
        3)  
            clear
            break;;
        4)
            createrecordfromtext;;
        *)
            dialog --msgbox "Invalid selection" 10 30;;
    esac
done

rm $temp 2> /dev/null