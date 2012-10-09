#!/usr/bin/env sh
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/.vimrc $HOME/.vimrc
ln -s $DIR/.vim $HOME/.vim
mkdir $DIR/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
