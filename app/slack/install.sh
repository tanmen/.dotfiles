#!/bin/sh
echo "Start install slack"

if [ ! -e /Applications/Slack.app ]; then
  brew cask install slack
fi
