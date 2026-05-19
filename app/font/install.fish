#!/usr/bin/env fish
echo (set_color blue)"          Start install font"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

# homebrew/cask-fonts は 2024 に homebrew/cask 本体に統合済みなので tap 不要。
dot_brew_cask_install font-fira-mono-for-powerline "" "Fira Mono for Powerline (font)"
