#!/bin/sh
echo "Start install daisydisk"

if [ ! -e /Applications/DaisyDisk.app ]; then
  brew install --cask daisydisk
fi
