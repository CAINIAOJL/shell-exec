#!/bin/sh

#echo "This is an error" >&2
#echo "This is a normal output"

#exec 2> testerr

#echo "This is a test of redirecting all errors to a file"

#exec 1> testout

#echo "This is a test of redirecting all output to a file"


#exec 0< testfile

#count=1

#while $(cat testfile) > read line
#do 
#    echo "Line $count: $line"
#    count=$((count+1))
#done


#exec 3>> testfile
#echo "This shuld dispaly on the screen"
#echo "This should display on the screen and also be appended to the file" >&3

#exec 3>&1
#exec 1>testfile

#echo "This is should stroe in th file"
#echo "along with this line"

#exec 1>&3

#echo "Now things should be back to normal"


#exec 6<&0

#exec 0< testfile

#count=1
#while read line
#do 
#    echo "Line #$count: $line"
#    count=$((count+1))
#done

#复原
#exec 0<&6
#read -p "Are you done now? " answer
#case $answer in
#    y|Y) echo "Goodbye";;
#    n|N) echo "Sorry , this is the end";;
#esac

#exec 3<> testfile

#read line <&3
#echo "Read: $line"
#echo "This is a test line" >&3

#exec 3> testfile
#echo "This is a test line of data" >&3
#exec 3>&-
#echo "This won't work" >&3

#exec 3> testfile 
#echo "This is a test line of data" >&3
#exec 3>&-

#cat testfile
#exec 3> testfile
#echo "This will be bad" >&3


#exec 3> testfile
#exec 6< testfile
#exec 7> testfile

#lsof -a -p $$ -d 0,1,2,3,6,7
#OLD_IFS=$IFS
#IFS=$'\n'
#while lsof | read -r line
#do 
#    echo "$line" > lsof.txt
#done
#IFS=$OLD_IFS

#lsof | while read -r line
#do
#    echo "$line" >> lsof.txt
#done


#tempfile=$(mktemp test19.XXXXXX)

#exec 3>"$tempfile"

#echo "This script writes to temp file $tempfile"

#echo "This is the first line" >&3
#echo "This is the second line" >&3
#echo "This is the third line" >&3
#exec 3>&-

#echo "Done creating temp file. The contents are:"

#cat $tempfile
#rm -f $tempfile 2> /dev/null

#tempdir=$(mktemp -t tmp.XXXX)

#echo "This is a test file." >$tempdir
#echo "This is the second line of the test." >> $tempdir

#echo "The temp file is located at $tempdir"
#cat $tempdir
#rm -f $tempdir


tempdir=$(mktemp -d dir.XXXX)
cd $tempdir
tempfile1=$(mktemp temp.XXXX)
tempfile2=$(mktemp temp.XXXX)

exec 7> $tempfile1
exec 8> $tempfile2

echo "Sending data to directory $tempdir"
echo "This is a test line of data for $tempfile1" >&7
echo "This is a test line of data for $tempfile2" >&8
