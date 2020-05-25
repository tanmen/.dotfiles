#!/usr/local/bin/fish
echo (set_color blue)           Start install karabiner(set_color normal)

if [ ! -e /Applications/Karabiner-Elements.app ]
  brew cask install karabiner-elements
end
