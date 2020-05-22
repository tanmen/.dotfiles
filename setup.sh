#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# brew install
if [ ! $(which brew) ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

sh $SCRIPT_DIR/app/setup.sh

exec $SHELL -l
