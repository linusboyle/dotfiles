#!/usr/bin/env bash
#Author: Zhilei Han <hzl17@mails.tsinghua.edu.cn> 

if [ $# -eq 0 ] 
then
    echo "Please pass file"
    exit 1
fi

sed -i -e 's/http:\/\/cdn/https:\/\/cdn/' $@
