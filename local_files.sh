#!/bin/bash
basepath=$(dirname $(readlink -f $0))

data_dir=$basepath/data

if [ ! -f $data_dir/git_identities ]
then
	echo "#[identity]:[email],[name]" > $data_dir/git_identities
fi
