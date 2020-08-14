#!/bin/bash

mkdir -p .cache/zsh
mkdir -p .vim/bundle
git clone https://github.com/robbyrussell/oh-my-zsh .oh-my-zsh
cp -r .oh_my_zsh_custom/* .oh-my-zsh/custom/
git clone https://github.com/VundleVim/Vundle.vim .vim/bundle/Vundle.vim
rm -rf setup.bash .git .oh_my_zsh_custom
wget https://github.com/ly4096x/dockertools/raw/master/dockertools -O .local/bin/dockertools
chmod +x .local/bin/dockertools
