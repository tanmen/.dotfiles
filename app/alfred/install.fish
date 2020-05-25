#!/usr/local/bin/fish
echo (set_color blue)           Start install alfred(set_color normal)

if [ ! -e /Applications/Alfred\ 4.app ]
  brew cask install alfred
end
