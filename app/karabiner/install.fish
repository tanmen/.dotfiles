#!/usr/bin/env fish
echo (set_color blue)"          Start install karabiner"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_cask_install karabiner-elements /Applications/Karabiner-Elements.app "Karabiner-Elements"
