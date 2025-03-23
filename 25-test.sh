#!/bin/bash

# 原脚本文件名
original_script="your_script.sh"

# 测试用例 1: 输入正确账户并确认删除，账户存在且无进程
test_case_1() {
    echo "Test Case 1: 输入正确账户并确认删除，账户存在且无进程"
    input="testuser
y
y
y
y
y"
    expected_output="User account, testuser, has been deleted"
    result=$(echo -e "$input" | bash "$original_script")
    if [[ $result == *"$expected_output"* ]]; then
        echo "Test Case 1 Passed"
    else
        echo "Test Case 1 Failed"
    fi
}

# 测试用例 2: 输入不存在的账户
test_case_2() {
    echo "Test Case 2: 输入不存在的账户"
    input="nonexistentuser
y
n"
    expected_output="Account. nonexistentuser is not exsit"
    result=$(echo -e "$input" | bash "$original_script")
    if [[ $result == *"$expected_output"* ]]; then
        echo "Test Case 2 Passed"
    else
        echo "Test Case 2 Failed"
    fi
}

# 测试用例 3: 输入账户后取消删除
test_case_3() {
    echo "Test Case 3: 输入账户后取消删除"
    input="testuser
n"
    expected_output="Since you do not want to delete testuser"
    result=$(echo -e "$input" | bash "$original_script")
    if [[ $result == *"$expected_output"* ]]; then
        echo "Test Case 3 Passed"
    else
        echo "Test Case 3 Failed"
    fi
}

# 测试用例 4: 输入账户有进程，选择不杀死进程
test_case_4() {
    echo "Test Case 4: 输入账户有进程，选择不杀死进程"
    input="testuser_with_process
y
y
y
n
n"
    expected_output="will no kill off processes"
    result=$(echo -e "$input" | bash "$original_script")
    if [[ $result == *"$expected_output"* ]]; then
        echo "Test Case 4 Passed"
    else
        echo "Test Case 4 Failed"
    fi
}

# 测试用例 5: 输入账户有进程，选择杀死进程
test_case_5() {
    echo "Test Case 5: 输入账户有进程，选择杀死进程"
    input="testuser_with_process
y
y
y
y
y"
    expected_output="Process killed"
    result=$(echo -e "$input" | bash "$original_script")
    if [[ $result == *"$expected_output"* ]]; then
        echo "Test Case 5 Passed"
    else
        echo "Test Case 5 Failed"
    fi
}

# 运行所有测试用例
#test_case_1
#test_case_2
#test_case_3
#test_case_4
#test_case_5