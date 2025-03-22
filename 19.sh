sed -sn '1F;
1s|#/bin/sh|#/bin/bash|' $HOME/shell-exec/*.sh | gawk 'BEGIN{
print""
print "The following scripts have /bin/sh as their shebang:"
print ""
}
{print $0 }
END{
print "End of report"}'


mkdir -p TestScript

for filename in $(grep -l "bin/sh" $HOME/shell-exec/*.sh)
do
    #只获取到文件名，不要路径
    newFilename=$(basename $filename)
    cat $filename | sed '1c\#!/bin/bash' > TestScript/$newFilename
done

grep -l "#!/bin/bash" TestScript/*.sh