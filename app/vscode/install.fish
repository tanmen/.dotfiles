#!/usr/local/bin/fish
echo (set_color blue)           Start install vscode(set_color normal)

if [ ! -e /Applications/Visual\ Studio\ Code.app ]
  brew cask install visual-studio-code
end
