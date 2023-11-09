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
ignored=$(git check-ignore $(cat $file | cut -d ':' -f1) | tr '\n' '|')
ignored=${ignored%|}

cat "$file" | awk -v patterns="$ignored" '{ n=split(patterns, arr, /\|/);
    for (i=1; i<=n; i++) if (index($0, arr[i]) > 0) next } 1' |\
awk -v basepath=$basepath '{
	get_code = "echo " $0 " | rev | cut -d \":\" -f1 | rev"
	get_code | getline code
	get_name = "cat " basepath "/data/coding-style-errors |\
		grep \"^" code "\" | cut -d \":\" -f2"
	get_name | getline name
	printf "%-50s %s\n", $0, name}
	close (get_code)
	close (get_name)'
rm -f $file
