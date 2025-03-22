sed -n '
{
1N;
N;
s/ //g;
s/\t//g;
s/\n/\a/g;
p
s/\a/\n/;
D}' data1.txt | sort | uniq -d | sed '
s/\a/\n/g'