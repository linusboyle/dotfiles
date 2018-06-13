#! /bin/bash
if test -d /media/linusboyle/14f640fa-0f21-4213-9c8b-d7eaa8d58682 
  then 
    #cat ~/bin/list|lolcat
    #dialog --menu "你好，狷墨，选择音乐：" 0 0 0 1 "Muktinath" 2 "仙鹤神针" 3 "狼" 4 "红面传说" 5 "邪马台国&地平天成" 6 "Cusco" 7 "女巫医一" 2>_tmp.txt
    dialog --file ~/bin/music.cfg 2>_tmp.txt
    if test $? != 0
    then 
      clear
      rm _tmp.txt
      exit 1
    else
      clear
    fi
  else
      cowsay "cannot find the disk"|lolcat
      exit 1
    fi 

choose=$(cat _tmp.txt)
path="/media/linusboyle/14f640fa-0f21-4213-9c8b-d7eaa8d58682/audio"
case "$choose" in
  1 )   mplayer -loop 0 $path/Muktinath/* ;;
  2 )   mplayer -loop 0 $path/仙鹤神针/*;;
  3 )   mplayer -loop 0 $path/狼/*;;
  4 )   mplayer -loop 0 $path/红面传说/*;;
  5 )   mplayer -loop 0 $path/邪马台国\&地平天成/*;;
  6 )   mplayer -loop 0 $path/Cusco/*/*;;
  7 )   mplayer -loop 0 $path/女巫医1/*;;
  8 )   mplayer -loop 0 $path/天舞三国志/*;;
  9 )   mplayer -loop 0 $path/高福顺/*/*;;
  10 )  mplayer -loop 0 $path/情咒/*;;
  * )   echo "error" 
    rm _tmp.txt
    exit 1;;
esac
rm _tmp.txt
exit 0
