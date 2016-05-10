#!/bin/bash

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
if [ ! -f ~/.vimrc ]; then
  ln -s ~/.vim/vim-adiog/.vimrc ~/.vimrc
fi

vim +PluginInstall +qall
vim +PluginUpdate +qall

#YouCompleteMe
#if [ ! -f ~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]; then
#  sudo apt-get install llvm-dev libclang-dev clang
#  export CXX=g++-4.9
#  cd ~/.vim/bundle/YouCompleteMe
#  ./install.py --clang-completer --system-libclang --system-boost
#fi

#vim-slime
if [ ! -f ~/.screenrc ]; then
  sudo apt-get install screen
  echo "msgwait 0" > ~/.screenrc
  echo "msgminwait 0" >> ~/.screenrc
fi

#tagbar
#which ctags > /dev/null || sudo apt-get install exuberant-ctags

