#!/usr/bin/env fish
echo (set_color blue)"          Start install fork"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_cask_install fork /Applications/Fork.app Fork
