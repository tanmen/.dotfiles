#!/usr/bin/env fish
echo (set_color blue)"          Start install git"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_install git
dot_ensure_symlink $DIR/.gitconfig ~/.gitconfig

if not test -e ~/.bin/git-delete-merged
    if dot_confirm "git-utils (tanmen/git-utils) を ~/.bin に clone しますか？"
        git clone git@github.com:tanmen/git-utils.git ~/.bin
    end
end
