#!/bin/sh
echo "Start install jetbrains-toolbox"

if [ ! -e /Applications/JetBrains\ Toolbox.app ]; then
  brew cask install jetbrains-toolbox
fi
