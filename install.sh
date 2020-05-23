#!/bin/sh
cd ~ || exit

if [ ! -d ~/.dotfiles ]; then
  git clone https://github.com/tanmen/.dotfiles.git
else
  git -C .dotfiles pull
fi

sh .dotfiles/setup.sh
