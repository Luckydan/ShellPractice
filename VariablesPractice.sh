#!/bin/bash
#SystemVariables

#系统变量
echo $HOME
echo %PWD
echo $SHELL

#自定义变量,无空格
A=2
echo $A

# 撤销变量
unset $A
echo $A

#声明静态变量，不能撤销
readonly B=3
echo $B






