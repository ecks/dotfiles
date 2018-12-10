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

if [ ! -d ~/.config/nvim/pack/minpac/opt/minpac ];
then
  mkdir -p ~/.config/nvim/pack/minpac/opt
  git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
elif [ $force = true ];
then
  rm -r ~/.config/nvim/pack/minpac/opt/minpac
  git clone https://github.com/k-takata/minpac.git ~/.config/nvim/pack/minpac/opt/minpac
fi
