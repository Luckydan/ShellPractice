#!/bin/bash
#SystemVariables

#系统变量
echo "##系统变量##"
echo $HOME
echo %PWD
echo $SHELL
echo $USER
# 查看当前shell的所有变量
echo `set`

#自定义变量,无空格
echo "##自定义变量##"
A=2
echo $A

# 撤销变量
unset A
echo $A

#声明静态变量，不能撤销
echo "##静态变量##"
readonly B=3echo $B

#全局变量,可以被其他脚本引用，例如JAVA_HOME
echo "##全局变量##"
PERSON=ming
export PERSON
echo $PERSON

# 特殊变量$n n为数字
# $0：表示该脚本名称
# $1-9:表示第一到九个参数
# $#:获取所有输入参数的个数
# $*:命令行中的所有参数，作整体看待
# $@:命令行中的所有参数，分开看待
# $?:最后一次执行的明亮的返回状态，如果结果为0，表示上一个命令正常执行，非0，则表示上一个命令执行不正确
echo "##特殊变量##"
echo "$0"
echo $1
echo $#
echo `ls -al /`
echo $?
