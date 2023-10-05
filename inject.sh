#!/bin/bash

if [ -z $1 ]
then
	echo "You have to set the \"shell\" variable to the name of the shell you want to be modified."
	echo "Available shells (not all of them are neces valid options):"
	find ~ -maxdepth 1 -type f -name ".*rc" | cut -d "." -f2 | cut -d 'r' -f1 | awk '{printf " -> %s\n", $0}'
else
    bash startup_command.sh >> $HOME/.$1rc
    echo "Restart your terminal for the changes to take effect"
fi
