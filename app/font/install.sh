#!/bin/sh
echo "Start install font"

if [ ! $(brew list | grep -E "^ricty\$") ]; then
  brew tap sanemat/font
  brew install ricty --with-powerline
fi

if [ ! $(brew cask list | grep -E "^font-fira-code\$") ]; then
  brew tap homebrew/cask-fonts
  brew cask install font-fira-code
fi

if [[ ! $(ls ~/Library/Fonts | grep -E "^Ricty.*\.ttf\$") ]]; then
  cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fi

fc-cache -vf 1>/dev/null
