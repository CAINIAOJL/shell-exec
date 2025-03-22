#!/bin/sh

#/snap/go/current/bin:/home/jianglei/.cargo/bin:/home/jianglei/.cargo/bin:/snap/go/current/bin:/home/jianglei/.cargo/bin:/home/jianglei/.cargo/bin:/home/jianglei/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/e/vmware17/bin/:/mnt/c/Program Files/Common Files/Oracle/Java/javapath:/mnt/c/Program Files/Microsoft MPI/Bin/:/mnt/c/Program Files/Microsoft/jdk-11.0.16.101-hotspot/bin:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0/:/mnt/c/Windows/System32/OpenSSH/:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/Users/蒋磊/AppData/Local/Programs/Julia-1.8.5/bin:/mnt/c/Program Files (x86)/Microsoft SQL Server/160/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL Server/160/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn/:/mnt/c/Program Files/Microsoft SQL Server/160/DTS/Binn/:/mnt/c/Program Files/Azure Data Studio/bin:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/:/mnt/c/WINDOWS/System32/OpenSSH/:/mnt/c/Program Files (x86)/Microsoft SQL Server/160/DTS/Binn/:/mnt/c/Program Files/MySQL/MySQL Server 8.0/bin:/mnt/c/msys64/mingw64/bin:/mnt/c/Program Files/NVIDIA Corporation/NVIDIA NvDLISR:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/CMake/bin:/mnt/e/ffmpeg/ffmpeg-7.1-essentials_build/bin:/mnt/c/Program Files/Microsoft SQL Server/150/Tools/Binn/:/mnt/e/apache-tomcat-9.0.97/bin:/mnt/c/Program Files (x86)/Windows Kits/10/Windows Performance Toolkit/:/mnt/e/apache-maven-3.6.0/bin:/mnt/c/Program Files/nodejs/:/mnt/c/Program Files/dotnet/:/mnt/c/Program Files/Java/jdk-21/bin:/mnt/c/Program Files/Java/jdk-21/jre/bin:/mnt/c/Users/蒋磊/AppData/Local/Microsoft/WindowsApps:/mnt/c/Program Files/Azure Data Studio/bin:/mnt/e/vscode/Microsoft VS Code/bin:/mnt/e/CLion 2024.1.1/bin:/mnt/c/Program Files/JetBrains/IntelliJ IDEA Community Edition 2024.1/bin:/mnt/c/Users/蒋磊/AppData/Local/GitHubDesktop/bin:/mnt/e/IntelliJ IDEA 2024.3.3/bin:/mnt/c/Users/蒋磊/.dotnet/tools:/mnt/c/Users/蒋磊/AppData/Roaming/npm:/mnt/e/hongmengos/DevEco Studio/bin:/snap/bin:/usr/local/go/bin/go:/opt/Qt/6.x.x/gcc_64/bin:/usr/local/go/bin:/snap/bin:/snap/bin:/home/jianglei/go/bin:/opt/Qt/6.x.x/gcc_64/bin:/usr/local/go/bin:/snap/bin:/snap/bin:/home/jianglei/go/bin

OLD_IFS=$IFS
IFS=:

for folder in $PATH
do
    for file in $folder/*
    do
        if [ -x $file ]; then
            echo "  $file can exec"
        fi
    done
done >> $HOME/shell-exec/All-exec.txt