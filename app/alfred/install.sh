#!/bin/sh
echo "Start install alfred"

if [ ! -e /Applications/Alfred\ 4.app  ]; then
  brew cask install alfred
fi
