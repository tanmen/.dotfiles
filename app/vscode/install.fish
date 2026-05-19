#!/usr/bin/env fish
echo (set_color blue)"          Start install vscode"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_cask_install visual-studio-code /Applications/Visual\ Studio\ Code.app "Visual Studio Code"
