#!/bin/sh

echo "download class shell scripting code"
cd ~/Downloads 
wget https://resources.oreilly.com/examples/9780596005955/-/archive/master/9780596005955-master.tar.gz

if [  $? -eq 0 ];then
   tar -zxf 9780596005955-master.tar.gz
   mv 9780596005955-master ~/Public/class_shell_scripting
fi


