#!/bin/sh
echo "Start install karabiner-elements"

if [ ! -e /Applications/Karabiner-Elements.app ]; then
  brew cask install karabiner-elements
fi
