#!/usr/bin/env bash
#Author: Zhilei Han <hzl17@mails.tsinghua.edu.cn> 

update () {
    cd "$1"
    git add -A
    git commit -m "update"
    git push origin master
}

update "/home/linusboyle/sync/vnote/notes/"
update "/home/linusboyle/sync/wiki/text/"
update "/home/linusboyle/dfile/"
