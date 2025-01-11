#!/bin/bash
basepath=$(dirname $(readlink -f $0))

data_dir=$basepath/data

ping -c 1 github.com && rm -rf ~/.local/share/nvim ~/.cache/nvim ~/.config/nvim

git clone https://github.com/NvChad/starter ~/.config/nvim/ || echo $(cd ~/.config/nvim && git pull origin main)

cat $data_dir/nvim_config.lua > ~/.config/nvim/lua/options.lua

mkdir -p ~/.config/nvim/plugin
cp $data_dir/42header.vim ~/.config/nvim/plugin/.

sed -i '/theme =/c\    theme = "flexoki",' ~/.config/nvim/lua/chadrc.lua

# add lsp config
input_file="$datadir/nvim_lsp.lua"
output_file="~/.config/nvim/lua/configs/lspconfig.lua"
target_line="-- Danis cool config"
awk -v target="$target_line" '{
  if ($0 == target) exit;  # Exit when the target line is found
  print;                  # Print lines before the target
}' "$output_file" | cat - "$input_file" > temp.txt
rm -f "$output_file"
mv temp.txt "$output_file"
