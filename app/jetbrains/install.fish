#!/usr/local/bin/fish
echo (set_color blue)           Start install jetbrains(set_color normal)

if [ ! -e /Applications/JetBrains\ Toolbox.app ]
  brew cask install jetbrains-toolbox
end
