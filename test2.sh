#!/bin/sh
echo "----------------------------------------------------"
if pwd; then 
    echo "pwd is true, pwd is" $pwd
else
    echo "pwd is false"
fi


echo "----------------------------------------------------"
testuser=nojianglei
test2user=jianglei
if grep $testuser /etc/passwd; then
    echo "user $testuser exists"
else
    echo "user $testuser does not exist"
    echo "search user $test2user"
    if ls -d /home/$test2user; then
        ls /home/$test2user/shell-exec/*.sh
    fi
fi

if grep $testuser /etc/passwd; then
    echo "user $testuser exists"
elif test ls -d /home/$test2user/; then
    ls /home/$test2user/shell-exec/*.sh
fi
echo "use elif"

echo "----------------------------------------------------"
my_variable=""

if test $my_variable; then
    echo "my_variable is true"
else
    echo "my_variable is false"
fi


echo "----------------------------------------------------"
value1=12
value2=23

if [ $value1 -gt $value2 ]; then
    echo "The test value $value1 is greater than $value2"
elif [ $value1 -lt $value2 ]; then
    echo "The test value $value1 is lesser than $value2"
fi

if [ $value1 -eq $value2 ]; then 
    echo "The test value $value1 is equal to $value2"
elif [ $value1 -ne $value2 ]; then
    echo "The test value $value1 is not equal to $value2"
fi


echo "----------------------------------------------------"
str1="hello"
str2="worldwww"
str3="www.baidu.com"
str4="www.yahogo.com"

if [ $str1 = $str2 ]; then 
    echo "str1 is equal to str2"
elif [ $str1 != $str2 ]; then
    echo "str1 is not equal to str2"
fi

if [ $str3 \> $str4 ]; then
    echo "str3 is greater than str4"
elif [ $str3 \< $str4 ]; then 
    echo "str3 is lesser than str4"
fi

#date >> test2.sh

#wc << EOF
#test string1
#test string2
#test string3
#EOF  # ✅ 确保EOF顶格书写

#date >>test2.sh
#Wed Mar 19 10:47:27 CST 2025
#Wed Mar 19 10:47:33 CST 2025
#Wed Mar 19 10:47:34 CST 2025
#Wed Mar 19 10:47:34 CST 2025
#Wed Mar 19 10:52:49 CST 2025
#Wed Mar 19 10:52:50 CST 2025
#Wed Mar 19 10:52:51 CST 2025
#Wed Mar 19 10:52:52 CST 2025
#Wed Mar 19 10:52:52 CST 2025
#Wed Mar 19 10:52:55 CST 2025
#Wed Mar 19 10:53:03 CST 2025
#Wed Mar 19 10:54:50 CST 2025

echo "----------------------------------------------------"
string1=socer
string2=''

#是否不为空
if [ -n $string1 ]; then
    echo "The string '$string1' is not empty"
else
    echo "The string '$string1' is empty"
fi

#是否为空
if [ -z $string2 ]; then
    echo "The string '$string2' is empty"
else
    echo "The string '$string2' is not empty"
fi


echo "----------------------------------------------------"
jump_directory=/home/jianglei

if [ -d $jump_directory ]; then
    echo "The directory '$jump_directory' exists"
else
    echo "The directory '$jump_directory' does not exist"
fi

echo "----------------------------------------------------"
location=$HOME
file_name="sentinel"

if [ -d $location ]; then
    echo "ok on the $location directory"
    echo "Now checking on the file, $file_name"
    if [ -e $location/$file_name ]; then
        echo "ok on the $file_name file"
        date >> $location/$file_name
    else
        echo "File, $location/$file_name, does not exist"
        echo "Nothing to update"
    fi
else
    echo "The directory '$location' does not exist"
fi


echo "----------------------------------------------------"
object_name=$HOME
echo
echo "home is " $HOME
echo "The object name is $object_name"
echo

if [ -e $object_name ]; then
    echo "The object, $object_name, is a file"
    if [ -f $object_name ]; then
        echo "The object, $object_name, is a regular file"
    else
        echo "The object, $object_name, is not a regular file"
    fi
else 
    echo "The object, $object_name, does not exist"
fi

echo "----------------------------------------------------"
pwfile=/etc/shadow
echo
echo "checking if you can read $pwfile"
echo

if [ -f $pwfile ]; then
    echo "The file $pwfile exists"
    if [ -r $pwfile ]; then
        echo "Displaying the file $pwfile"
        tail $pwfile
    else
        echo "can not read the file: $pwfile"
        echo "Premission defined"
    fi
else
    echo "The file $pwfile is not exist"
fi

echo "----------------------------------------------------"
file_empty=$HOME/shell-exec/test2.sh
echo
echo "Checking if $file_empty is empty"
echo

if [ -f $file_empty ]; then
    echo "File $file_empty exists"
    if [ -s $file_empty ]; then 
        echo "The file $file_empty is not empty, has data in it"
        echo "will not remove this file"
    else 
        echo "The file $file_empty is empty, has no data in it"
        echo "Delete empty file $file_empty"
        rm $file_empty
    fi
else
    echo "File $file_empty does not exist"
fi
        

#echo "----------------------------------------------------"
#file_write=$HOME/shell-exec/test2.sh
#echo
#echo "Checking if $file_write is abled to written data"
#echo

#if [ -f $file_write ]; then
#    echo "File $file_write exists"
#    if [ -w $file_write ]; then 
#        echo "The file $file_write can be written data"
#        #date +%H%M >> $file_write
#        date >> $file_write
#    else 
#        echo "The file $file_write can not be written data"
#        echo "Premission defined"
#    fi
#else
#    echo "File $file_write does not exist"
#fi

#Wed Mar 19 11:27:56 CST 2025


echo "----------------------------------------------------"
file_exec=$HOME/shell-exec/test2.sh
echo
echo "Checking if $file_exec can exec"
echo

if [ -x $file_exec ]; then 
    echo "we can exec file $file_exec"
    echo "Running file $file_exec"
    #sh $file_exec
else
    echo "we can not exec file $file_exec"
fi

echo "----------------------------------------------------"
file_owner=$HOME/shell-exec/test2.sh

echo
echo "checking if $file_owner is owned by you"
echo

if [ -0 $file_owner ]; then
    echo "The file $file_owner is owned by you"
else
    echo "The file $file_owner is not owned by you"
fi

if [ -d $HOME ] || [ -w $HOME/newfile ]; then
    echo "The file exists and you can write to it"
else
    echo "you can not write to the file"
fi

echo "----------------------------------------------------"
if (cat /etc/PASSWORD); then
    echo "subshell command succeeded"
else
    echo "subshell command failed"
fi

echo "----------------------------------------------------"

exprval=10

if (($exprval ** 2 > 90)); then
    ((exprval1=$exprval ** 2))
    echo "The square of $exprval is $exprval1"
    echo "which is greater than 90"
fi

echo "----------------------------------------------------"

if [ $USER == "rich" ]; then 
    echo "welcome $USER"
    echo "plase enjoy your visit"
elif [ $USER == "guest" ]; then
    echo "welcome $USER"
    echo "plase enjoy your visit"
elif [ $USER == "tim" ]; then
    echo "welcome $USER"
    echo "plase enjoy your visit"
elif [ $USER == "testing" ]; then
    echo "welcome $USER"
    echo "plase enjoy your visit"
else
    echo "welecome $USER"
    echo "plase enjoy your visit"
fi

