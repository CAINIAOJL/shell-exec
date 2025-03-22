#!/bin/sh

#trap "echo 'Sorry! I have trapped Ctrl-C'" SIGINT
#trap "echo Goodbye!" EXIT

#count=1
#while [ $count -le 10 ]
#do
#    echo "Loop #$count"
#    sleep 1
#    count=$((count+1))
#done

#echo "This is the end of test script."
#exit

#trap "echo 'Sorry! I have trapped Ctrl-C'" SIGINT
#count=1
#while [ $count -le 10 ]
#do 
#    echo "Loop #$count"
#    sleep 1
#    count=$((count+1))
#done

#trap -- SIGINT
#trap "echo 'Sorry! I have modified trapped Ctrl-C'" SIGINT
#count=1
#while [ $count -le 10 ]
#do 
#    echo "Loop #$count"
#    sleep 1
#    count=$((count+1))
#done
#exit

echo "Starting the script... ID: $$"
count=1
while [ $count -le 100 ]
do
    echo "Loop #$count"
    sleep 1
    count=$((count+1))
done
echo "script is done"