#!/usr/bin/env fish
echo (set_color blue)"          Start install mas"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_install mas

dot_mas_install 497799835  Xcode
dot_mas_install 975937182  Fantastical
dot_mas_install 1274495053 "Microsoft To Do"
dot_mas_install 425955336  Skitch
dot_mas_install 803453959  Slack
