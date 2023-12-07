#!/usr/local/bin/fish
echo (set_color blue)           Start install vscode(set_color normal)

if [ ! -e /Applications/Visual\ Studio\ Code.app ]
  brew install --cask visual-studio-code
end
