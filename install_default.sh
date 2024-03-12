#!/usr/bin/env bash

packages="git
		vim
		tree
		zsh
        valgrind
        build-essential
		flameshot
		gobuster
		nmap
		openvpn
		sl
		rustc
		cargo"

if command -v dnf &> /dev/null; then
	echo "Using dnf"
	sudo dnf install $packages
elif command -v apt &> /dev/null; then
	echo "Using apt"
	sudo apt install $packages
else
	echo "No supported package manager found"
fi

./config_flameshot
./rice_vim
echo 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"' | /bin/zsh

#NVchad
cargo install --git https://github.com/MordechaiHadad/bob.git
bob use latest
git clone https://github.com/NvChad/starter ~/.config/nvim #theme: flexoki
mkdir -p ~/.local/share/fonts
cp data/AgaveNerdFont-Regular.ttf ~/.local/share/fonts
