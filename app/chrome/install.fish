#!/usr/local/bin/fish
echo (set_color blue)           Start install chrome(set_color normal)

if [ ! -e /Applications/Google\ Chrome.app ]
  brew cask install google-chrome
end
