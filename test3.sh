#!/bin/sh


OLD_IFS=$IFS
IFS=$'\n'
for entry in $(cat /etc/passwd)
do 
    echo "Values in $entry - "
    echo $entry >> $HOME/shell-exec/passwd.txt
    IFS=:
    for value in $entry
    do 
        echo "   $value"
        echo $value >> $HOME/shell-exec/passwd.txt
    done
done
IFS=$OLD_IFS #还原IFS
echo "----------------------------------------------------"