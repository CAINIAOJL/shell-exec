#!/bin/bash
#crv: userId,userName
echo "$HOME"
input="$HOME/shell-exec/users.csv"
OLD_IFS=$IFS
IFS=','

if [[ ! -f "$input" ]]; then
    echo "File $input does not exist"
    exit 1
fi

while read -r loginname name || [[ -n "$loginname" || -n "$name" ]]
do 
    loginname=$(echo "$loginname" | tr -d '\r')
    name=$(echo "$name" | tr -d '\r')

    if [[ -z $loginname && -z "$name" ]]; then
        continue
    fi
    
    echo "adding $loginname"
    sudo useradd -c "$name" -m "$loginname"
done < "$input"
IFS=$OLD_IFS