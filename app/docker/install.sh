#!/bin/sh
echo "Start install docker"

if [ ! -e /Applications/Docker.app ]; then
  brew cask install docker
fi
