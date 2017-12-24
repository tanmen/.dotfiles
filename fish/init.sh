#!/usr/local/bin/fish

# fishのpackage managerをインストール
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

# https://github.com/fisherman/z
fisher z
# https://github.com/fisherman/fzf
fisher fzf
# https://github.com/edc/bass
fisher edc/bass
# https://github.com/omf/theme-bobthefish
fisher omf/theme-bobthefish
