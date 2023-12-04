#!/usr/bin/env bash

if command -v dnf &> /dev/null; then
	echo "Using dnf"
	sudo dnf install CSFML-devel
elif command -v apt &> /dev/null; then
	echo "Using apt"
	sudo apt install libcsfml-dev
else
	echo "No supported package manager found"
fi
