#!/bin/sh
echo "Start install git"

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ ! $(brew list | grep -E "^git\$") ]; then
  brew install git
else
  brew upgrade git
fi

# gitの設定
if [ ! -L ~/.gitconfig ] || [[ -n $(find -L ~/.gitconfig -type l) ]]; then
  rm -f ~/.gitconfig
  ln -s $SCRIPT_DIR/.gitconfig ~/.gitconfig
fi
