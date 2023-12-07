#!/usr/local/bin/fish
echo (set_color blue)           Start install jetbrains(set_color normal)

if [ ! -e /Applications/JetBrains\ Toolbox.app ]
  brew install --cask jetbrains-toolbox
end
