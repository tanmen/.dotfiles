#!/usr/bin/env fish
echo (set_color blue)"          Start install alfred"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_cask_install alfred /Applications/Alfred\ 5.app Alfred
