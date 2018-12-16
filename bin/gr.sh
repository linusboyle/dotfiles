#!/bin/bash

path=$(pwd -P)

while true
do
    if test "$path" == "/";then
        break
    fi
    if test -d "$path/.git";then
        cd $path
        break
    fi
    path=$(dirname "$path")
done

