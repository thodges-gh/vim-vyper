#!/usr/bin/sh

mkdir -p ~/.vim/syntax/
mkdir -p ~/.vim/ftdetect/
mkdir -p ~/.vim/indent/

curl -L "https://github.com/thodges-gh/vim-vyper/raw/master/syntax/vyper.vim" -o ~/.vim/syntax/vyper.vim
curl -L "https://github.com/thodges-gh/vim-vyper/raw/master/ftdetect/vyper.vim" -o ~/.vim/ftdetect/vyper.vim
curl -L "https://github.com/thodges-gh/vim-vyper/raw/master/ftdetect/vyper.vim" -o ~/.vim/indent/vyper.vim
