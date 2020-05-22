#!/bin/sh
echo "Start install java"

if [ ! $(brew cask list | grep -E "^java\$") ]; then
  brew cask install java
fi
