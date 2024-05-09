#!/bin/sh
DIR=$(cd $(dirname $0); pwd)

# brew install
if [ ! $(which brew) ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  brew update
fi

# directory構成
if [ ! -d ~/Projects ]; then
  mkdir ~/Projects
fi
if [ ! -d ~/Tools ]; then
  mkdir ~/Tools
fi
if [ ! -d ~/Tmp ]; then
  mkdir ~/Tmp
fi

if [ ! -d ~/.bin ]; then
  mkdir ~/.bin
fi

if [ ! -e /Library/Developer/CommandLineTools ]; then
  sudo xcodebuild -license accept
fi

sh $DIR/fish/install.sh

fish $DIR/app/setup.fish

exec $SHELL -l
