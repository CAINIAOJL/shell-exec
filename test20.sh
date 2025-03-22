#!/bin/bash

factorial=1
count=1
number=$1

while [ $count -le $number ]
do 
    factorial=$(( factorial * count ))
    count=$((count+1))
done

result=$(echo $factorial | sed '
{:start s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/; t start }')
                           #sed '{:start s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/ t start }'
echo "The result is "$result""