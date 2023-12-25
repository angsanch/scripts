#!/bin/bash
basepath=$(dirname $(readlink -f $0))

data_dir=$basepath/data

cat $data_dir/vimrc > ~/.vimrc

mkdir -p ~/.vim/colors
#cp $data_dir/one-monokai.vim ~/.vim/colors

mkdir -p ~/.vim/plugin
cp $data_dir/42header.vim ~/.vim/plugin/.
