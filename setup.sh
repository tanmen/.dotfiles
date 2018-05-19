#!/bin/sh

# powerline fontをインストール
brew tap sanemat/font
brew install ricty --with-powerline

cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

FISH_RESULT=`./fish/install.sh`
echo $FISH_RESULT

# fzfをinstall
brew install fzf

# anyenvをinstall
git clone https://github.com/riywo/anyenv ~/.anyenv
anyenv install rbenv
anyenv install nodenv
anyenv install goenv

# java をインストール
brew tap caskroom/versions
brew cask install java8
