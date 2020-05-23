#!/bin/sh
echo "Start install fork"

if [ ! -e /Applications/Fork.app ]; then
  brew cask install fork
fi
