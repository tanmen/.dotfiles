#!/bin/sh
echo "Start install google-chrome"

if [ ! -e /Applications/Google\ Chrome.app ]; then
  brew cask install google-chrome
fi
