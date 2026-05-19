#!/usr/bin/env fish
echo (set_color blue)"          Start install jetbrains"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_cask_install jetbrains-toolbox /Applications/JetBrains\ Toolbox.app "JetBrains Toolbox"
