#!/usr/local/bin/fish

# fishのpackage managerをインストール
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

# config をセット
ln -s ~/.dotfiles/fish/config.fish ~/.config/fish

# https://github.com/fisherman/z
fisher z
# https://github.com/fisherman/fzf
fisher fzf
# https://github.com/edc/bass fishでもbashがうごくようにする
fisher edc/bass
# https://github.com/omf/theme-bobthefish
fisher omf/theme-bobthefish
# https://github.com/oh-my-fish/plugin-exenv
fisher oh-my-fish/plugin-exenv
