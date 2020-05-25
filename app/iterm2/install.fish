#!/usr/local/bin/fish
echo (set_color blue)           Start install iterm2(set_color normal)

if [ ! -e /Applications/iTerm.app ]
  brew cask install iterm2
end
