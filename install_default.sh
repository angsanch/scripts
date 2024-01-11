#!/usr/bin/env bash

packages="git
		vim
		tree" 

if command -v dnf &> /dev/null; then
	echo "Using dnf"
	sudo dnf install $packages
elif command -v apt &> /dev/null; then
	echo "Using apt"
	sudo apt install $packages
else
	echo "No supported package manager found"
fi
