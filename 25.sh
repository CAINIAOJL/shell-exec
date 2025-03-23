#!/bin/bash
#不要随意运行

get_answer() {

count=0
unset answer

while [ -z "$answer" ]
do  
    count=$((count+1))
    case $count in 
        0)
        ;;
        1)
            echo
            echo "once, please enter y or n"
            echo;;
        2)
            echo
            echo "twice, please enter y or n"
            echo;;
        3)
            echo
            echo "thrice, please enter y or n"
            echo;;
        4)
            echo
            echo "fourth, closing now..."
            exit 1
    esac 
    if [ -n "$line2" ]; then
        echo "$line1"
        echo -e $line2"  \c"
    else
        echo -e $line1"  \c" 
    fi

    read -t 60 answer
done
unset line1
unset line2
}

process_answer() {
    answer=$(echo $answer | cut -c1) # cut the first character
    case $answer in 
        y|Y)
            echo "Yes";;
        *)
            echo
            echo $exit_line1
            echo $exit_line2
            echo;;
    esac

unset exit_line1
unset exit_line2

}

echo
echo "Step #1 - Deletemine User Account name to delete"
echo

line1="Please enter the username to delete:"
line2="account you want to delete for system:"
get_answer
user_account=$answer

line1="Is $user_account correct?(Is your want to delete this account?)"
line2="you want to delete $user_account? [y/n]"
get_answer

exit_line1="Because ths account, $user_account is not exsit"
exit_line2="the one tou want to delete is not exsit, closing now ..."
process_answer

user_account_record=$(cat /etc/passwd | grep -w $user_account)

if [ $? -eq 1 ]; then
    echo
    echo "Account. $user_account is not exsit"
    echo "closing now..."
    echo 
    exit 1 #退出码1
fi

echo
echo "we found the $user_account_record"
echo 

line1="Is this the account you want to delete? [y/n]"
get_answer

exit_line1="Because the account, $user_account is not exsit"
exit_line2="the one tou want to delete is not exsit, closing now ..."
process_answer

echo
echo "Step #2 - Find processes that use the account"
echo

ps -u $user_account > /dev/null

case $? in
    1)
        echo "No processes found using $user_account";;
    0)
        echo "$user_account has the following processes running:"
        ps -u $user_account
        line1="Would you like to kill these processes? [y/n]"
        get_answer
        answer=$(echo $answer | cut -c1)
        case $answer in
            y|Y)
                echo
                echo "Killing off processes ..."
                
                command_1="ps -u $user_account --no-heading"
                command_2="xargs -d \\n /usr/bin/sudo /bin/kill -9"
                $command_1 | gawk '{print $1}' | $command_2

                echo
                echo "Process killed";;
            *)
                echo
                echo "will no kill off processes";;
        esac;;
esac
echo 
echo "Step #3 - Find the files om system by $user_account"
echo

echo "creating a file list for $user_accounr"
echo
echo "It is recommended that you backup/archive these files,"
echo "and then do one of two things: "
echo "  1) Delete the files"
echo "  2) Change the owner of the files to another account"
echo
echo "Please wait, This mayy take a while ..."

report_date=$(date +%y%m%d)
report_file="$user_account"_File_"$report_date".rpt

find / -user $user_account >> $report_file 2>/dev/null

echo
echo "Report is complete,"
echo "Name of report:    $report_file"
echo -n "Location of report: "; pwd
echo

echo
echo "Step #4 - Delete the account"
echo
line1="Do you wish to remove $user_account from system? [y/n]"
get_answer
exit_line1="Since you do not want to delete $user_account"
exit_line2="$user_account at the time, closing now..."
process_answer

userdel $user_account
echo
echo "User account, $user_account, has been deleted"
echo

exit 0



