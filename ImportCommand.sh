#!/bin/bash


# 重点命令
# cut
# 1.用法
# cut -d 切 隔符 -f 取的列索引 文件名

cut_result1=`echo $PATH | cut -d : -f 1,2`
# result=`echo $PATH | cut -d : -f 3-`
echo $cut_result1

# echo `ifconfig eth1`

cut_result2=`ifconfig eth1 | grep "netmask" |cut -d ' ' -f10-| cut -d : -f 2|cut -d " " -f 7-`
echo $cut_result2

# sed
# 1.解释
# sed是一种流编辑器，一次处理一行内容，但并不改变源文件
# 2.语法
# sed [选线参数] ‘command’ filename
# 3.选项参数
# e : 直接再指令列模式上进行sed的动作编辑
# 4.命令功能描述
# a: 新增，a的后面可以接字符串，在下一行出现
# d: 删除
# s: 查找并替换

# 在第二行添加#test
sed '2a #test' /home/linuxcast/ShellPrctice/test1.txt
echo "************"
#将test.sh中的test删除
sed '/test/d' /home/linuxcast/ShellPrctice/test1.txt
echo "******************"
# 将test.sh中的test替换为text,加g表示全局替换
sed "s/test/text/g" /home/linuxcast/ShellPrctice/test1.txt
echo "*******************"

sed -e "2d" -e "s/test/text/g" /home/linuxcast/ShellPrctice/test1.txt

# awk
# 1.解释
# 一个强大的文本分析工具，把文件逐行的读入，以空格为默认分隔符将每行切分，切开的部分再进行分析
# 2.用法
# awk [选项参数] 'pattern1{action1} patter2{action2}...' filename
# pattern:表示awk再数据中查找的内容，就是匹配模式
# action: 在找到匹配内容时所执行的一系列命令
# 3.选线参数
# -F 指定输入文件拆分分隔符
# -v 赋值一个用户定义变量
# 4.awk的内置变量
# FILENAME:文件名
# NR:已读的记录数，行数
# NF:切割后的列个数

# 搜索passwd文件中以root开头的所有行，并输出第七列
echo "====================================="
awk -F : '/^root/ {print $7}' /home/linuxcast/ShellPrctice/passwd

# 搜索passwd文件中以root开头的所有行，并输出第一列和第七列
awk -F : '/^root/ {print $1 "," $7}' /home/linuxcast/ShellPrctice/passwd

# 显示passwd文件中以所有行的第一列和第七列，在所有行前添加HelloShell,在最后一行添加 got it , /bin/bash
echo "====================================="
awk -F : 'BEGIN{print "HelloShell"} {print "123" $1 "," $7} END{print "got it, /bin/bash"}' /home/linuxcast/ShellPrctice/passwd

#将passwd文件中的用户id增加数值1并输出
awk -F : -v i=1 '{print $3+i}' /home/linuxcast/ShellPrctice/passwd

# 统计passwd文件名，每行的行号，每列的列数
awk -F : '{print "filename:" FILENAME "," NR "," NF}' /home/linuxcast/ShellPrctice/passwd

#查询passwd中空行所在的行号
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
awk '/^$/{print NR}' /home/linuxcast/ShellPrctice/passwd

#删除空行
#sed '/^$/d' input.txt > output.txt    #output file: output.txt
#sed -i '/^$/d' input.txt      #output file: input.txt
#awk 'NF > 0' input.txt > output.txt     #output file: output.txt
#perl -i.backup -n -e "print if /\S/" input.txt   #output file: input.txt.backup
#grep -v '^$' input.txt > output.txt    #output file: output.txt


# sort
# 1.语法
# sort(选项)(参数)
# -n:依照数值的大小排序
# -r:以相反的顺序来排序
# -t:设置排序所用的分隔符
# -k:指定需要排序的列

#以 ： 分割，按数值对第二列进行倒叙排列
sort -t : -nrk 2 /home/linuxcast/ShellPrctice/import.txt
