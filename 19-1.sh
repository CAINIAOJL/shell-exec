#!/bin/bash

echo "########## Function Declarations ###############"
function errorExit {
    echo
    echo $message1
    echo $message2
    echo "Exiting script...."
    exit 1
}

function modifyScripts {
    echo 
    read -p "Directory name in which to store new scripts? " newScriptDir
    echo "Modifying the scripts started at "$date" nanoseconds"
    if [ -d $newScriptDir ]; then
        echo "The $newScriptDir directory already exists."
    else
        echo "The $newScriptDir directory does not exist. Creating it now."
        mkdir -p $newScriptDir
    fi
    count=1
    for filename in $(grep -l "#!/bin/sh" $scriptDir/*.sh)
    do
        newFilename=$(basename $filename)
        cat $filename | sed '1c #!/bin/bash' > $newScriptDir/$newFilename
        echo "$count script modified, $newFilename is in $newScriptDir"
        count=$((count+1))
    done
    echo "$count script modified completed at "$date" nanoseconds"
}

#第一个参数是我们要解析的目录
if [ -z $1 ]; then
    message1="The name of the directory to search for scripts is required(NULL)"
    message2="missing!. so we will close! try again, input the directory name"
    errorExit
else
    scriptDir=$1
fi

function dispalyScript {
    sed -sn '1F;
    1s|#!/bin/sh|#!/bin/bash|' $scriptDir/*.sh |
    gawk 'BEGIN{ print ""
    print "The following scripts have /bin/sh as their shebang:"
    print "===================================================="}
    {print $0}
    END{print ""
    print "End of Report"}' 
}

function changeScript {
    echo
    read -p "Do you want to modify these scripts  " answer
    case $answer in
        y|Y)
            modifyScripts;;
        n|N)
            message1="No scripts will be modified."
            message2="Run this script later to modfiy, if desired"
            errorExit;;
        *)
            message1="Did not answer y or n"
            message2="No scripts will be modified."
            errorExit;;
    esac
}
echo "The dir you put should be Relative path, like "shell-exec""
dispalyScript
changeScript