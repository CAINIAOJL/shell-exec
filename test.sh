#!/bin/sh

echo "User info for userid: $USER"
echo UID: $UID
echo HOME: $HOME

var1=10
var2=20
var3=30
var4=40

days=10
guest="katie"
echo "$guest is a guest for $days days"

testing=$(date)
echo "the date and time is: "$testing

result=$(expr $var1 + $var2)
echo "result is: "$result
result2=$[$result * 2]
echo "result2 is: "$result2

bc1=$(echo "scale=122; 3.444 / 5" | bc)
echo "bc1 is: "$bc1

bc2=23
bc3=43
bc4=$(echo "scale=5; $bc2 / $bc3" | bc)
echo "bc4 is: "$bc4

a1=1
a2=1
a3=1
a4=1
a5=$(bc << EOF
scale=4
aa1 = $a1 + $a2
aa2 = $a3 + $a4
aa1 + aa2
EOF
)

echo " aa1 + aa2 is " $a5

date1="Jan 1, 2020"
date2="May 1, 2020"

time1=$(date -d "$date1" "+%s")
time2=$(date -d "$date2" "+%s")
diff=$(expr $time2 - $time1)
secondsinday=$(expr 24 \* 60 \* 60)
days=$(expr $diff / $secondsinday)
echo "the difference between $date1 and $date2 is $days days"



echo $?