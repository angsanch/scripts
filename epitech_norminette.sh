#!/bin/bash
basepath=$(dirname $(readlink -f $0))

dir=$(pwd)
save_dir=$basepath
file_name="coding-style-reports.log"

if [ ! -z $1 ]
then
	dir=$1
fi

echo $dir $save_dir
coding-style $dir $save_dir | awk 'END{printf "%s", $0}'
echo
echo
cat $save_dir/$file_name
rm -f $save_dir/$file_name
