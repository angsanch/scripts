#!/bin/bash

if [ $# -eq 0 ]
	then
	echo "No arguments supplied."
	echo "./ path branch"
	exit 84
fi

datadir="${1}/root"

if [ -z "$2" ]
	then
	echo "No branch specified"
	git submodule add git@github.com:angsanch/c_lib.git $1
else
	echo "Branch: " $2
	git submodule add -b $2 git@github.com:angsanch/c_lib.git $1
fi

cp -nr "${datadir}/.gitignore" "${datadir}/Makefile" "${datadir}/vars.mk" .

echo
echo "Remember to add name in Makefile and gitignore"
