#!/bin/zsh
set -ev

mkdir -p .cache/zsh
git clone https://github.com/robbyrussell/oh-my-zsh .oh-my-zsh
cp -r .oh_my_zsh_custom/* .oh-my-zsh/custom/
rm -rf setup.bash .git .oh_my_zsh_custom

curl -Lo ~/.local/bin/dockertools --create-dirs https://github.com/ly4096x/dockertools/raw/master/dockertools
chmod +x ~/.local/bin/dockertools

curl -Lo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/autoload/
ln -s $(realpath --relative-to=$HOME/.vim/autoload/ "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim) ~/.vim/autoload/
if ! command -v nvim &> /dev/null ; then
    vim +PlugUpdate +qall
else
    nvim +PlugUpdate "+CocInstall coc-git coc-pyright coc-json" +qall
fi
