#!/bin/bash

#echo This script name is $0

#name=$(basename $0)

#echo This script name is $name


#if [ -n "$1" ]; then
#    factorial=1
#    for (( number = 1; number <= $1; number++ ))
#    do 
#        factorial=$(( factorial * number ))
#    done
#    echo The factorial of $1 is $factorial
#else
#    echo "No argument supplied"
#fi

#echo Ths is number of parameters is $#
#echo The last parameter is ${$#}
#echo The last parameter is ${!#}


#echo 
#echo Using the \$* method: $*
#echo 
#echo Using the \$@ method: $@
#echo "----------------------------------"

#echo "Using the \$* method: $*"

#count=1
#for param in "$*"
#do
#    echo "\$* parameter #$count is $param"
#    count=$((count+1))
#done
#echo
#echo "Using the \$@ method: $@"
#count=1
#for param in "$@"
#do 
#    echo "\$@ parameter #$count is $param"
#    count=$((count+1))
#done
echo "----------------------------------"
echo

#echo "Using shfit method:"
#count=1
#while [ -n "$1" ]
#do 
#    echo "Parameter #$count is $1"
#    count=$((count+1))
#    shift
#done
#echo "----------------------------------"
#echo

#echo "The original parameters: $*"
#echo "Now shfiting 2..."
#shift 2
#echo "Here's the new first parameter: $1"
#echo "----------------------------------"
#echo


#while [ -n "$1" ]
#do 
#    case "$1" in
#            -a) echo "Found the -a option" 
#            ;;
#            -b) echo "Found the -b option" 
#            ;;
#            -c) echo "Found the -c option" 
#            ;;
#            --) 
#                shfit #遇到--退出选项判断
#                break
#               ;;
#            *) echo "$1" is not an option 
#            ;;
#    esac
#    shift
#done
#while [ -n "$1" ]; do
#    case "$1" in
#        -a) echo "Found the -a option" ;;
#        -b) echo "Found the -b option" ;;
#        -c) echo "Found the -c option" ;;
#        --) 
#            shift  # 移除 -- 本身
#            break   # 退出循环，停止解析选项
#            ;;
#        *) echo "$1 is not an option" ;;
#    esac
#    shift  # 处理完一个参数后，移除它
#done
#echo 
#while [ -n "$1" ]
#do 
#    case "$1" in
#        -a) echo "Found the -a option" ;;
#        #当$1为-b时，$2为-b的跟着的参数
#        -b) param=$2
#            echo "Found the -b option with parameter value $param"
#            shift;;
#        -c) echo "Found the -c option" ;;
#        --) shift
#            break;;
#        *) echo "$1 is not an option";;
#    esac
#    shift
#done

#set -- $(getopt -q ab:cd "$@")
#echo
#while [ -n "$1" ]
#do 
#    case "$1" in
#        -a) echo "Found the -a option" ;;
#        -b) param=$2
#            echo "Found the -b option with parameter value $param"
#            shift;;
#        -c) echo "Found the -c option" ;;
#        --) shift
#            break;;
#        *) echo "$1 is not an option" ;;
#    esac
#    shift
#done
#开头冒号提示使用默显模式
while getopts :ab:cd opt
do
    case "$opt" in
        a) echo "Found -a option" ;;
        b) echo "Found -b option with value $OPTARG";;
        c) echo "Found -c option" ;;
        d) echo "Found -d option" ;;
        *) echo "$opt is not an option" ;;
    esac
done
#echo
#count=1
#for param in "$@"
#do
#    echo "Parameter #$count: $param"
#    count=$((count+1))
#done
shift $((OPTIND-1))
count=1
for param in "$@"
do 
    echo "Parameter #$count: $param"
    count=$((count+1))
done
echo "----------------------------------"
echo