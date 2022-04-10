#!/bin/zsh
set -e

REQUIRED_EXE=(node yarn curl git)
for x in ${REQUIRED_EXE[@]} ; do
    if ! command -v $x ; then
        echo Require: $REQUIRED_EXE, and vim or neovim.
        exit
    fi
done

mkdir -p .cache/zsh
git clone https://github.com/robbyrussell/oh-my-zsh .oh-my-zsh
cp -r .oh_my_zsh_custom/* .oh-my-zsh/custom/
rm -rf setup.bash .git .oh_my_zsh_custom

curl -Lo ~/.local/bin/dockertools --create-dirs https://github.com/ly4096x/dockertools/raw/master/dockertools
chmod +x ~/.local/bin/dockertools

curl -Lo .local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/autoload/
ln -s ../../.local/share/nvim/site/autoload/plug.vim) ~/.vim/autoload/
if ! command -v nvim &> /dev/null ; then
    vim +PlugUpdate +qall
else
    nvim +PlugUpdate +qall
    nvim "+CocInstall coc-git coc-pyright coc-json" +qall
fi
