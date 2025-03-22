#!/bin/sh

factorial=1

for (( number = 1; number <= $1; number++ ))
do 
    factorial=$((factorial * number))
done
echo the factorial of  is $factorial
echo "----------------------------------------------------"
echo

echo "hello $2, glad to meet you"
