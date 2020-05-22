#!/bin/sh
echo "Start install anyenv"

if [ ! $(brew list | grep -E "^anyenv\$") ]; then
  brew install anyenv
else
  brew upgrade anyenv
fi

if [ ! -d $(anyenv root)/plugins ]; then
  mkdir -p $(anyenv root)/plugins
else
  echo "$(anyenv root)/plugins already exists"
fi

if [ ! -d $(anyenv root)/plugins/anyenv-update ]; then
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
else
  echo "$(anyenv root)/plugins/anyenv-update already exists"
fi

if [ ! -d ~/.config/anyenv/anyenv-install ]; then
  anyenv install --init
fi

if [[ ! $(anyenv version | grep -E "^exenv:") ]]; then
  anyenv install exenv
fi

if [[ ! $(anyenv version | grep -E "^rbenv:") ]]; then
  anyenv install rbenv
fi

if [[ ! $(anyenv version | grep -E "^nodenv:") ]]; then
  anyenv install nodenv
fi

if [[ ! $(anyenv version | grep -E "^goenv:") ]]; then
  anyenv install goenv
fi

if [ ! -d $(nodenv root)/plugins/jetbrains-npm ]; then
  git clone https://github.com/nodenv/jetbrains-npm $(nodenv root)/plugins/jetbrains-npm
else
  echo "$(nodenv root)/plugins/jetbrains-npm already exists"
fi
