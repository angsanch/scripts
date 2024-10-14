#!/bin/bash
basepath=$(dirname $(readlink -f $0))

data_dir=$basepath/data

rm -rf ~/.local/share/nvim ~/.cache/nvim

cat $data_dir/nvim_config.lua > ~/.config/nvim/lua/options.lua

git clone https://github.com/NvChad/starter ~/.config/nvim/ || echo $(cd ~/.config/nvim && git pull origin main)
echo "remember to change theme to flexoki. spc + t + h"
