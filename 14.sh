echo "###########################################"
echo
#从屏幕读取文件名
#read -p "Please enter the file name:" FILENAME

#检查文件是否存在，并且可读
#if [[-f "$FILENAME" && -r "$FILENAME" ]]; then
#    echo "$FILENAME is a file, is readable"
#else 
#    echo "$FILENAME is not a file or is not readable"
#fi
# t:
# -t IPV4
while getopts :t:h opt
do
    case "$opt" in 
        t) echo "Found -t option"
            if [ "$OPTARG" == "IPV4" ]; then
                pingAlive=$(which ping)
            elif [ "$OPTARG" == "IPV6" ]; then
                pingAlive=$(which ping6)
            else 
                #提示
                echo "please input IPV4 or IPV6 for -t"
                echo "closing now ..."
                exit 1
            fi
            ;;
        h) 
            echo "Usage: $0 -t IPV4|IPV6 ipaddress [ipaddress...]"
            echo "Example: $0 -t IPV4 8.8.8.8"
            exit 0
            ;;
        *) echo "Usage: -t IPv4 or -t IPv6"
           echo "closing now ..."
           exit 1;;
    esac
    shift $((OPTIND-1)) # 参数左移

    #检查-t IPV4/IPV6 address参数是否为空
    #if [! -n "$*" ]; then
    #    echo "please input ip address"
    #    echo "closing now ..."
    #fi

    if [ "$#" -eq 0 ];then
        echo "please input ip address"
        echo "closing now ..."
        exit 1
    fi

    #可以是多个ip地址
    for param in "$@"
    do 
        echo
        echo "getting the ip address and ping now"
        echo 

        $pingAlive -c 3 $param
    done
    exit 0
done

echo "############################################"
echo "please input the filename with a absolute directory reference..."
echo

choice=0

while [ $choice -eq 0 ]
do
    read -t 10 -p "Enter the name of the file: " #reply
    #输入为空，给出提示，
    if [ -z "$REPLY" ]; then
        echo "you input nothing, please try again "
        echo "please choose one blow"
        #-t time -n input length -p tip
        read -t 10 -n 1 -p "y/Y is try again and n/N is exit now(time limit 10s)" ANSWERCODE
        case "$ANSWERCODE" in
            y|Y) echo "you choose y. try again"
                  $choice=0
                  ;;
            n|N) echo "you choose n. exit now"
                  exit 1
                  ;;
            *) echo "you input is not y/Y or n/N, please try again"
                exit 1
               ;;
        esac
    else 
        echo "you input is $REPLY"
        choice=1 #退出循环，进入文件内容输出阶段
    fi
done

if [[ -f "$REPLY" && -r "$REPLY" && -s "$REPLY" ]]; then
    echo "you input file is a file, is readable and is not empty"
    echo
    #管道运算符
    cat $REPLY | while read line
    do 
        ipaddress=$line
        read line
        iptype=$line
        if [ "$iptype" == "IPV4" ]; then
            pingAlive=$(which ping)
        elif [ "$iptype" == "IPV6" ]; then
            pingAlive=$(which ping6)
        else 
            echo "please input IPV4 or IPV6 for -t"
            exit 1
        fi
        echo "checking system ip address, ping now ..."
        $pingAlive -c 3 $ipaddress
        echo
    done
    echo "finished process ping ip address"
else
    echo "you input file is not a file or is not readable or is empty"
    exit 1
fi
exit 0

