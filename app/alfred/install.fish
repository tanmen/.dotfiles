#!/usr/local/bin/fish
echo (set_color blue)           Start install alfred(set_color normal)

if [ ! -e /Applications/Alfred\ 5.app ]
  brew install --cask alfred
end
