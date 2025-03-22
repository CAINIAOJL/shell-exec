#!/bin/sh

OLD_IFS=$IFS
IFS=','


outfile="members.sql"

#判断文件是否为空
if [ -z ${1} ]; then
    echo "Please enter the name of the file to process: xxxx.csv"
    exit 1
fi

if [ ! -f $outfile ]; then
    echo "The file $outfile does not exist, creating it"
    touch $outfile
fi


while read -r lname fname address city state zip
do
    echo "INSERT INTO members (lname, fname, address, city, state, zip) VALUES ('$lname', '$fname', '$address', '$city', '$state', '$zip');" >> $outfile
done < ${1}
