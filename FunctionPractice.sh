#!/bin/bash

# 系统函数
# 1.basename基本语法
# 语法：basename [string /pathname][suffix]
# 解释：删除所有的前缀包括最后一个‘/’字符，然后将字符显示出来

path=`basename /home/linuxcast/ShellPractice/test.sh`
echo $path

# 2.dirname基本语法
# 语法：dirname 文件绝对路径
# 解释：从给定的包含绝对路径的文件名中去除文件名，返回剩下的路径

dir=`dirname /home/linuxcast/ShellPractice/test.sh`
echo $dir

# 自定义函数
# 1.基本语法
# [ function ] funname[()]
# {
#      action
#      [return int;]
# }
# funname
# 注意事项：
# (1)必须再调用函数地方之前，先声明函数
# (2)函数返回值，只能通过$?系统变量获取，可以显示加 return返回，若果不加，以最后一条命令运行结果，作为返回值;return 后跟数值n(0-255)
function sum()
{
	s=0;
	s=$[$1+$2]
	echo $s
}
#read -p "input first parameter:" P1
#read -p "input second parameter:" P2
P1=1
P2=2
sum $P1 $P2
