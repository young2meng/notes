#!/bin/sh

#最小化安装
#https://www.jianshu.com/p/e95f1b1b4561

#sudo apt-get update
#sudo apt-get install apt-file
#sudo apt-file update
echo "install cmd markdown"
#https://blog.csdn.net/sun2333/article/details/86028812
cd ~/Downloads 
wget http://static.zybuluo.com/cmd_markdown_linux64.tar.gz
if [  $? -eq 0 ];then
   tar -zxf cmd_markdown_linux64.tar.gz
   mv cmd_markdown_linux64 ~/Desktop/
   cd ~/Desktop/cmd_markdown_linux64 
   apt-file search libgconf-2
   apt-file search libgconf-2-4
   sudo apt -y install libgconf2-4
fi

echo "install autojump"
# https://www.cnblogs.com/liuqd001/p/10496871.html
sudo apt-get install autojump
#3.以常规用户身份运行下面的命令:
source /usr/share/autojump/autojump.sh on startup
#4.为了使得 autojump 在 BASH shell 中永久有效，执行下面的命令:
echo '. /usr/share/autojump/autojump.sh'>>~/.bashrc

echo "install vim"
sudo apt-get install vim

echo "install git"
sudo apt-get install git

#echo "generate local git key pair"
#https://download.csdn.net/download/dyh200896/10468795?utm_source=bbsseo

echo "install curl"
sudo apt-get install curl 

rm -rf ~/Downloads/* 
