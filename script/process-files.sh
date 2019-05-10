#!/usr/bin/env bash

function process_files()
{
    shopt -s dotglob
	local source_dir=$1
	local files_dir=$2
	local mode=$3
    for f in $files_dir/*;
        do
           name=${f##*/}
           if [ $mode = "copy" ];then
           			rsync -v $source_dir/$f ~/$name
           	elif [ $mode = "link" ]; then
           			ln -sfhv $source_dir/$f ~/$name
           	fi
        done
}

process_files $1 $2 $3

