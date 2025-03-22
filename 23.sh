#!/bin/bash

for team in $(gawk -F, '{print $2}' data.txt | uniq)
do
    #echo $team
    gawk -v team=$team -F, 'BEGIN{total=0}
    {
        if (team==$2) {
            total+=$3
            total+=$4
            total+=$5
        }
    }
    END{
        avg=total/6
        print "team:",team,"total score is",total,"avg score is",avg
    }' data.txt
done