#!/usr/bin/env fish
echo (set_color blue)"          Start install mise"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

# anyenv (旧) の代替。mise activate は fish/config.fish 側で読み込む。
dot_brew_install mise
