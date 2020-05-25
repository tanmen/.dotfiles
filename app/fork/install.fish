#!/usr/local/bin/fish
echo (set_color blue)           Start install fork(set_color normal)

if [ ! -e /Applications/Fork.app ]
  brew cask install fork
end
