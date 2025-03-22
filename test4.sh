#!/bin/sh

for test in Alabama Alaska Arizona Arkansas California Colorado
do
    echo "The next state is $test"
done

echo "----------------------------------------------------"

for word in I don\'t know if "this'll" work
do 
    echo "The next word is $word"
done
echo "----------------------------------------------------"
for test2 in Nevada "New Hampshire" "New Mexico" "New York" "North Carolina"
do
    echo "The next test2 is $test2"
done
echo "----------------------------------------------------"

list="Alabama Alaska Arizona Arkansas Colorado"
list=$list" Connecticut"

for l in $list
do 
    echo "have you visit $l"
done
echo "----------------------------------------------------"

file1=$HOME/shell-exec/states.txt

for s1 in $(cat $file1)
do
    echo "Visit beautful $s1"
done
echo "----------------------------------------------------"

file2=$HOME/shell-exec/states.txt
OLD_IFS=$IFS
IFS=$'\n'
for s2 in $(cat $file2)
do 
    echo "Visit beautful $s2"
done
IFS=$OLD_IFS

echo "----------------------------------------------------"
for file3 in $HOME/shell-exec/* $HOME/czkatran/*
do
    if [ -f "$file3" ]; then
        echo "$file3 is a file"
    elif [ -d "$file3" ]; then
        echo "$file3 is a directory"
    else 
        echo "$file3 is something else"
    fi
done
echo "----------------------------------------------------"

for (( i = 1, j = 0; i <= 10, j <= 20; i++, j += 2 ))
do 
    echo "The next i number is $i"
    echo "The next j number is $j"
    echo
done
echo "----------------------------------------------------"

var1=10

while [ $var1 -gt 0 ] 
do 
    echo $var1
    var1=$((var1-1))
done
echo "----------------------------------------------------"

var1=10

while echo $var1 && [ $var1 -gt 0 ]
do 
    echo "This is inside the loop"
    var1=$((var1-1))
done
echo "----------------------------------------------------"

var1=100
until [ $var1 -eq 0 ]
do 
    echo $var1
    var1=$((var1-25))
done
echo "----------------------------------------------------"

var1=100
until echo $var1 && [ $var1 -eq 0 ]
do 
    echo "Inside the loop: $var1"
    var1=$((var1-25))
done
echo "----------------------------------------------------"

for (( a = 1; a <= 10; a++ ))
do 
    for (( b = 0; b <= 20; b+=2 ))
    do 
        echo "The next a number is $a"
        echo "The next b number is $b"
        echo
    done
done
echo "----------------------------------------------------"

var1=5

while [ $var1 -gt 0 ]
do
    echo "Outer loop: $var1"
    for ((var2=1;var2 < 3; var2++))
    do 
        var3=$((var1*var2))
        echo "Inner loop: $var1 * $var2 = $var3"
    done
    var1=$((var1-1))
done
echo "----------------------------------------------------"


var1=3

until [ $var1 -eq 0 ]
do
    echo "Outer loop: $var1"
    var2=1
    while [ $var2 -lt 5 ]
    do 
        var3=$(echo "scale=3; $var1 / $var2" | bc)
        echo "   Inner loop: $var1 / $var2 = $var3"
        var2=$((var2+1))
    done
    var1=$((var1-1))
done
echo "----------------------------------------------------"