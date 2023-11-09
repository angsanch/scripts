#!/bin/bash
basepath=$(dirname $(readlink -f $0))

data_dir=$basepath/data

echo '
syntax on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set number
command Cc set colorcolumn=80
command Ncc set colorcolumn-=80
Cc

" Highlight trailing spaces and tabs
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"
' > ~/.vimrc

mkdir -p ~/.vim/colors
#cp $data_dir/one-monokai.vim ~/.vim/colors
