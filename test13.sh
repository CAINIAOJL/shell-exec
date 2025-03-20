#!/bin/bash

#func1() {
    #echo "trying to display the func1 no-exist-file"
    #ls ttfefd.txt
    #read -p "enter a number " num
    #echo "return double number-enter"
    #return $((num*2))
#}

#echo "begining the func test"
#func1
#echo "the exit code is $?"

#function addem 
#{
#    if [[ $# -eq 0 || $# -gt 2 ]]; then
#        echo -1
#    elif [ $# -eq 1 ]; then
#        echo $[ $1 + $1 ]
#    else 
#        echo $[ $1 + $2 ]
#    fi
#}

#echo -n "Adding 10 and 15: "
#value=$(addem 10 15)
#echo $value
#echo -n "try again, try one number 10:"
#value=$(addem 10)
#echo $value
#echo -n "try again, try three numbers 10, 15, 20:"
#value=$(addem 10, 15, 20)
#echo $value

#function addem 
#{
#    echo $[ $1 + $2 ] 
#}

#参数个数为2
#if [ $# -eq 2 ]; then
    #value=$(addem ${1} ${2})
#    value=$(addem $1 $2)
#    echo "The result is $value"
#else
#    echo "Usage: ./test13.sh 12 21"
#    exit 1
#fi


#function func1 {
#    local temp=$[ $value + 5 ]
#    result=$[ $temp * 2 ]
#}

#temp=4
#value=6

#func1

#echo "The result is $result"
#if [ $temp -gt $value ]; then
#    echo "temp is larger"
#else
#    echo "value is larger"
#fi

#function testit {
#    echo "The parameters are $@" #显示全部参数
    #thisarray=$1
    #echo "The received array is "${thisarray[*]}""
#    local sum=0
#    local newarray=(echo "$@") #填充传递过来的参数到局部变量数组中
#    for num in ${newarray[*]} #遍历局部数组
#    do 
#        sum=$((sum+num))
#    done
#    echo "The sum is $sum"
#}

#function testit {
#    local origarray
#    local newarray
#    local elements
#    local i
    #origarray=( echo "$@" )
    #newarray=( echo "$@" )
    #elements=$[ $# - 1 ]

#    origarray=( "$@" ) # $@变量是函数传递过来的参数
#    newarray=( "$@" )
#    elements=$(( "$#" )) # $#变量是函数传递过来的参数个数



#    for (( i = 0; i < "$elements"; i++ ))
#    do 
        #newarray[$i]=$[ ${origarray[$i]} *2 ]
#        newarray[$i]=$(( origarray[i] * 2 ))
#    done

#    echo ${newarray[*]}
#}

function factorial {
    if [ $1 -eq 1 ]; then
        echo 1
    else
        local temp=$(($1-1))
        local result=$(factorial $temp)
        echo $((result * $1))
    fi
}

#myarray=(1 2 3 4 5 6)
#echo "The original array is "${myarray[*]}"" #遍历输出显示
#testit ${myarray[*]}
#arg1=$(echo ${myarray[*]}) #数组元素为函数参数
#result=$(testit $arg1)
#echo "The new array is "${result[*]}""

read -p "enter number for factorial func: " value
result=$(factorial $value)
echo "The factorial of $value is $result"