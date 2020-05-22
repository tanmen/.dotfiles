#!/bin/sh
echo "Start install iterm2"

if [ ! -e /Applications/iTerm.app ]; then
  brew cask install iterm2
fi
