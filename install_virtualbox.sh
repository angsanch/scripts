#!/usr/bin/env bash

if command -v apt &> /dev/null; then
	echo "Using apt"
	sudo apt install virtualbox
else
	echo "No supported package manager found"
    exit
fi

sudo usermod -aG vboxusers $USER
