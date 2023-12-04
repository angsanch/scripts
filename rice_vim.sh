#!/bin/bash
basepath=$(dirname $(readlink -f $0))

data_dir=$basepath/data

cat data/vimrc > ~/.vimrc

mkdir -p ~/.vim/colors
#cp $data_dir/one-monokai.vim ~/.vim/colors
