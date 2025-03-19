#!/bin/bash

echo -n "Enter your name: "
read name
echo "Hello $name"

read -p "Please enter your age: " age
days=$((age * 365))
echo "you have been alive for $days days"

read  -t 10 -p "Enter your name: "
echo
echo "Hello $REPLY"


read -n 1 -p "Do you want to continue? [y/Y n/N]"

case "$REPLY" in
    y | Y) echo
            echo "Okay, Continue on ...."
        ;;
    n | N) echo
            echo "Okay, Exit now"
            exit 3
        ;;
esac
echo "This is the end of the script"


read -s -p "Enter your password: "
echo "your password is $REPLY"


count=1
cat $HOME/shell-exec/test6.txt | while read line
do
    echo "Line $count: $line"
    count=$((count+1))
done