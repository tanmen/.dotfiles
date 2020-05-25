#!/usr/local/bin/fish
echo (set_color blue)           Start install java(set_color normal)

if not brew cask list | grep -E "^java\$"
  brew cask install java
end
