#!/bin/sh

# powerline fontをインストール
brew tap sanemat/font
brew install ricty --with-powerline

cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

FISH_RESULT=`./fish/install.sh`
echo $FISH_RESULT

# erlang をインストール
brew install erlang
brew install elixir-build
brew install exenv

# ruby をインストール
brew install rbenv

# node をインストール
brew install nodenv

# go をインストール
brew install goenv

# java をインストール
brew tap caskroom/versions
brew cask install java
