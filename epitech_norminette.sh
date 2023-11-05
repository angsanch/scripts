#!/bin/bash
basepath=$(dirname $(readlink -f $0))

dir=$(pwd)
save_dir=$basepath
file_name="coding-style-reports.log"
file=$save_dir/$file_name

if [ ! -z $1 ]
then
	dir=$1
fi

echo $dir $save_dir
$basepath/epitech_coding-style.sh $dir $save_dir | awk 'END{printf "%s", $0}'
echo
echo 
ignored=$(git check-ignore $(cat $file | cut -d ':' -f1) | sed "s/ /\\|/")

cat $file | grep -v "$ignored" |\
awk -v basepath=$basepath '{
	get_code = "echo " $0 " | rev | cut -d \":\" -f1 | rev"
	get_code | getline code
	get_name = "cat " basepath "/coding-style-errors | grep \"^" code "\" | cut -d \":\" -f2" 
	get_name | getline name
	printf "%-50s %s\n", $0, name}
	close (get_code)
	close (get_name)'
rm -f $file
