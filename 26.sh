#!/bin/bash

runAccountAudit="false"
runPermAudit="false"

reportDir="$HOME/shell-exec/AuditReport"
#mkdir -p "$reportDir"
if [ -d "$reportDir" ]; then
    echo "Report directory exists"
else
    echo "Report directory does not exist"
    sudo mkdir -p "$reportDir"
    echo "Report directory created"
fi


while getopts :Ap opt 
do
    case $opt in 
        A)
            runAccountAudit="true";;
        p)
            runPermAudit="true";;
        *)
            echo "Invalid option: -$opt"
            echo "Usage: [-A],[-p] or [-Ap]"
            exit 1;;
    esac
done

if [ "$OPTIND" -eq 1 ]; then
    echo "No options"
    runAccountAudit="true"
    runPermAudit="true"
fi

if [ "$runAccountAudit" = "true" ]; then
    echo 
    echo "*********** Account Audit Report ***********"
    echo

    echo "Number of current false/nologin shells:"
    report_date="$(date +%F%s)"
    accountReport=$reportDir/AccountAudit$report_date.rpt

    cat /etc/passwd | cut -d: -f7 | grep -E "(nologin|false)" | wc -l | sudo tee $accountReport

    sudo chattr +i $accountReport

    preReport="$(ls -1t $reportDir/AccountAudit*.rpt | sed -n '2p')"
    if [ -z "$preReport" ]; then
        echo
        echo "No previous report"
    else
        echo
        echo "Previous report's false/nologin shells: "
        cat $preReport
    fi
fi

if [ "$runPermAudit" = "true" ]; then
    echo
    echo "******* SUID/SGID Audit********"
    echo
    report_date="$(date +%F%s)"
    permReport="$reportDir"/PermissionAudit"$report_date".rpt
    echo "Creating report, This may take a while..."
    #sudo find / -perm /6000 >$permReport 2>/dev/null
    sudo bash -c "find / -perm /6000 > "$permReport" 2>/dev/null"
    if [ -f "$permReport" ]; then
        sudo chattr +i "$permReport"
    else
        echo ""$permReport" not exists"
    fi
    prevReport="$(ls -1t "$reportDir"/PermissionAudit*.rpt | sed -n '2p')"

    if [ -z "$prevReport" ]; then
        echo
        echo "No previous permission report exists to compare."
    else
        echo 
        echo "Differences between this report and the last: " 
        difference=$(diff "$prevReport" "$permReport")
        if [ -z "$difference" ]; then
            echo "No differences found"
        else
            echo "$difference"
        fi
    fi
fi

exit 0