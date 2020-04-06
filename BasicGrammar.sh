#!/bin/bash

# 运算符语法两种形式：
# 1.$((运算式)) 或者 $[运算式]
# 2.expr +,-,\*,/,%  (加减乘除取余,此种方式运算符两侧必须有空格)
expr 2 + 3
expr 20 - 3
expr 3 \* 4 + 5 + 2

result=$[(2+3)*4]
echo $result

# 条件判断语法
# [ condition ]
# 注意：codition前后必须有空格
# 条件非空即为true

# (1)两个整数之间比较
# = 字符串比较
# -lt 小于
# -le 小于等于
# -eq 等于
# -gt 大于
# -ge 大于等于
# -ne 不等于
 [ 23 -le 32 ]
 echo $?
[ 3 -gt 8 ]
echo $?

# (2)按照文件权限进行判断
# -r 有读的权限
# -w 有写的权限
# -x 有执行的权限
[ -w BasicGrammar.sh ]
echo $?

# (3)按照文件类型判断
# -f 文件存在并且是一个常规的文件
# -e 文件存在
# -d 文件夹存在并是一个目录
[ -f BasicGrammar.sh ]
echo $?
echo $PWD

# (4)多条件判断
# [ codition1 ] && [ condition2 ] || [ condition3 ]
# 含义：
# &&：表示前一条命令执行成功时，才执行后一条命令
# ||：表示上一条命令执行失败后，才执行后一条命令
[  ] || echo "|| 前一条失败，执行后一条"
[ true ] && echo "&& 前一条成功，执行后一条"

# if判断语法
# (1) 第一种
# if [ 条件判断式 ];then
# 	程序
# fi
# (2) 第二种
# if [ 条件判断式 ]
# then
# 	程序
# fi
# 注意：条件判断式左右必须有空格，if后面必须有空格
#
if [ $1 -eq 1 ];then
    echo "第一个参数等于1"
elif [ $1 -eq 2 ];then
	echo "第一个参数等于2"
fi

# cash 语法
# case $变量名 in
#     "值1"）
#         结果1
#         ;;
#     "值2"）
#         结果2
#         ;;
#     "*)"
#         默认结果
#         ;;
# esac
case $1 in
	1)
		echo "结果1"
		;;
	2)
		echo "结果2"
		;;
	*)
		echo "默认结果"
		;;
esac


# for循环语法
# (1) 第一种
# for(( 初始值；循环控制；变量变化 ))
# do
# 	程序1
# done
sum=0
for((i=0;i<100;i++))
do
	sum=$[$sum+$i]
done
echo $sum

# (2) 第二种
# for 变量 in 值1 值2 值3....
# do
#     程序
# done
# 当$*加引号后为一个整体，$@不管如何处理都不会是整体输出
for i in "$*"
do
    echo "输入参数值： $i"
done

for i in "$@"
do
    echo "输入参数值： $i"
done

# while基本语法:
# while [ 条件判断式 ]
# do
# 	  程序
# done
i=1
s=0
while [ $i -lt 100 ]
do
	s=$[$s+$i]
	i=$[$i+1]
done
echo $s
