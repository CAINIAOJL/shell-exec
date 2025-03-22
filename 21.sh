#!/bin/bash

#echo "count number of files in your path"

#mypath=$(echo $PATH | sed 's/:/ /g')
#count=0

#for file in $mypath
#do
#    check=$(ls $file)
#    for item in $check
#    do
#        count=$((count+1))
#    done
#    echo "$file - $count"
#    count=0
#done

#电话号码的过滤                                                             比较下面多匹配了空格
#cat phonelist | gawk --re-interval '/^\(?[2-9][0-9]{2}\)?(| |-|\.)[0-9]{3}(| |-|\.)[0-9]{4}/ {print $0}'

#cat phonelist | gawk --re-interval '/^\(?[2-9][0-9]{2}\)?(| |-|\.)[0-9]{3}( |-|\.)[0-9]{4}/{print $0}' 

# ^头锚点,$尾锚点
# +一次或多次出现

cat maillist | gawk --re-interval '/^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/ {print $0}'
#cat maillist | gawk --re-interval '/^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/ {print $0}'

#gawk '/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/{print $0}' maillist