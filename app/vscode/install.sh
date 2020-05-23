#!/bin/sh
echo "Start install vscode"

if [ ! -e /Applications/Visual\ Studio\ Code.app ]; then
  brew cask install visual-studio-code
fi
