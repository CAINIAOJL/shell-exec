#!/bin/sh

echo "This is a test script"

count=1
while [ $count -le 20 ]
do
    echo "Loop #$count"
    sleep 1
    count=$((count+1))
done

echo "This is the end of the script"

exit