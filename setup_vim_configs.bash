#!/bin/bash

force=false
options=":f"

while getopts $options option
do
  case $option in
    f ) force=true;;
    * ) force=false;;
  esac
done

if [ ! -d ~/.config/nvim/repos/github.com/Shougo/dein.vim ];
then
  mkdir -p ~/.config/nvim/repos/github.com/Shougo/
  git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/repos/github.com/Shougo/dein.vim
elif [ $force = true ];
then
  rm -r ~/.config/nvim/repos/github.com/Shougo/dein.vim
  git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/repos/github.com/Shougo/dein.vim
fi
