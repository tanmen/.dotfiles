#!/bin/sh

ROOT=$(cd $(dirname $0);pwd)

# brew install
if [ ! $(which brew) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# java をインストール
brew cast install java

# gpg
brew install gpg
brew cask install gpg-suite-no-mail

# fontをインストール
brew tap sanemat/font
brew install ricty --with-powerline
brew tap homebrew/cask-fonts
brew cask install font-fira-code

cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

# jqをinstall yarnのcompleteで必要
brew install jq

# fzfをinstall
brew install fzf

# anyenvをinstall
brew install anyenv
mkdir -p $(anyenv root)/plugins
git clone git:github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
anyenv install rbenv
anyenv install nodenv
anyenv install goenv
git clone https://github.com/nodenv/jetbrains-npm $(nodenv root)/plugins/jetbrains-npm

# directory構成
mkdir ~/Projects
mkdir ~/Tools
mkdir ~/Tmp

if [ -e ~/.gitconfig ]; then
  rm ~/.gitconfig
fi

# gitの設定
ln -s $ROOT/git/.gitconfig ~

# gpgの設定
rm ~/.gnupg/gpg-agent.conf
ln -s $ROOT/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

# install fish
FISH_RESULT=`$ROOT/fish/install.sh`
echo $FISH_RESULT
anyenv install --init
exec $SHELL -l
