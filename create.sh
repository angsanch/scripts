#!/bin/bash

if [ ! -f "$1" ]
then
	touch "$1"
fi

if [[ "$1" == *".c" || "$1" == *".h" ]]
then
	mode="c"
elif [[ "$1" == "Makefile" ]]
then
	mode="m"
else
	echo "Not valid file name"
	exit
fi

echo "Write the description(ctrl+d to end):"
./header.sh $mode "$2" | cat - "$1" > "$1.temp"
mv "$1.temp" "$1"
