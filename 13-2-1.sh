#!/bin/sh
#crv: userId,userName

echo "$HOME"
input="$HOME/shell-exec/users.csv"

# 检查文件是否存在
if [[ ! -f "$input" ]]; then
    echo "Error: File $input does not exist."
    exit 1
fi

OLD_IFS=$IFS
IFS=','

# 读取并处理文件
while read -r loginname name || [[ -n "$loginname" || -n "$name" ]]
do
    # 去除可能的行尾字符（如 \r）
    loginname=$(echo "$loginname" | tr -d '\r')
    name=$(echo "$name" | tr -d '\r')

    # 跳过空行
    if [[ -z "$loginname" && -z "$name" ]]; then
        continue
    fi

    echo "adding $loginname"
    sudo useradd -c "$name" -m "$loginname"
done < "$input"

IFS=$OLD_IFS