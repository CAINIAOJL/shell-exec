#!/bin/sh

# -S SIGNUMBER
signalList=""
nices=0
while getopts :S: opt
do
    case "$opt" in
        S) echo "Get -S, will handle args"
            IFS=',' read -ra args <<< "$OPTARG"
            for arg in "${args[@]}"
            #for arg in "$OPTARG"
            do 
                case $arg in
                    1) signalList=$signalList"SIGHUP ";;
                    2) signalList=$signalList"SIGINT ";;
                    20) signalList=$signalList"SIGTSTP ";;
                    *) echo "Invalid signal number $arg"
                       echo "Closing Now ..."
                       exit 1;;
                esac
            done;;
        n) echo "Get -n, will set nice for script"
            echo "nice for script default is 0"
            nices=$(( nices+OPTARG ));;
        *) echo "Usage -S SIGNUMBER"
           echo "Closing Now ..."
           exit 1;;
    esac
done 
echo "The signalList is $signalList"
shift $((OPTIND-1)) #参数左移，寻找参数
# $# 获取参数个数 $@ 参数列表 $* 参数列表整体

#检查脚本是否为空
if [ -z "$@" ]; then
    echo 
    echo "Please enter script file name"
    echo "Usage -S SIGNUMBER scriptfile"
    echo "Closing Now ..."
    exit 1
fi
#TOOD：-O 文件是否存在，-x 文件是否可执行
if [[ -O "$@" && -x "$@" ]]; then
    scriptToRun="$@" #TOOD test12.sh
    scriptToOut="$@"".out" #TOOD test12.sh.out
else 
    echo "your enter file $@ is not a file or is not executable"
    echo "Closing Now ..."
    exit 1
fi
#exec 3>debug.txt
trap "" $signalList 
# sh test12.sh > test12.sh.out & #TOOD 后台运行
nice -n $nices ./$scriptToRun > $scriptToOut &
#ps 
#sh $scriptToRun > $scriptToOut &
