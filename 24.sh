#!/bin/bash


day=$(date +%d)
month=$(date +%m)
time=$(date +%H%M%S)

#backupFile=backupFile"$(date +%Y%m%d)".tar.gz
backupFile=backupFile"$time".tar.gz
backupDir=$HOME/shell-exec/backup/$month/$day
mkdir -p $backupDir

configFile=$HOME/shell-exec/config.txt
destination=$backupDir/$backupFile


if [ -f $configFile ]; then
    echo "configFile exists"
else 
    echo "configFile does not exist"
    exit 1
fi

file_no=1
#exec 0< $configFile
#read file_name 
#while [ $? -eq 0  ]
file_list=""
while read -r file_name
do 
    if [ -z $file_name ]; then
        continue
    fi
    if [ -f $file_name -o -d $file_name ]; then
        file_list="$file_list $file_name"
    else 
        echo "$file_name does not exist"
        echo "Are you sur the file name is correct?"
        echo
    fi
    file_no=$((file_no+1))
done < "$configFile"

echo "Begin to backup to "$destination""
echo
if tar -czf $destination $file_list; then
    echo "backup is successful"
else
    echo "backup is failed" >&2
    exit 1
fi
echo "back up is completed"
echo

exit 0
