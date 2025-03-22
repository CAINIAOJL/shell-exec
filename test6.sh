#!/bin/sh

for var in 1 2 3 4 5 6 7 8 9
do 
    if [ $var -eq 5 ]; then
        break
    fi
    echo "Iteration number $var"
done
echo "----------------------------------------------------"
echo 

for (( a = 1; a < 5; a++ ))
do 
    echo "Outer loop: $a"
    for (( b = 1; b < 100; b++ )) 
    do 
        if [ $b -eq 50 ]; then
            break 2 #跳出外层循环
        fi
        echo "  Inner loop: $b"
    done
done
#echo "----------------------------------------------------"
#echo
#for (( a = 1; a <= 10; a++ ))
#do 
#    for (( b = 0; b <= 20; b+=2 ))
#    do 
#        echo "The next a number is $a"
#        echo "The next b number is $b"
#        echo
#    done
#done
#echo "----------------------------------------------------"
#echo


#var1=0

#while echo "while iteration: $var1" && [ $var1 -lt 15 ]
#do
#    if [ $var1 -gt 5 ] && [ $var1 -lt 10 ]; then
#        continue 3 #都跳了
#    fi
#    echo "  Inside iteration number: $var1"
#    var1=$((var1+1))
#done
#echo "----------------------------------------------------"
#echo

for (( a = 1; a <= 5; a++ ))
do
    echo "Iteration $a"
    for (( b = 1; b < 3; b++ ))
    do 
        if [ $a -gt 2] && [ $a -lt 4]; then
            continue 2 #跳过两次内层循环
        fi
        var3=$((a*b))
        echo " The result of $a * $b = $var3"
    done
done
echo "----------------------------------------------------"
echo


for state in "North Dakota" Connecticut Illinois Alabama Tennessee
do
    echo "$state is the place to go"
done | sort
echo "This completes our tracels"