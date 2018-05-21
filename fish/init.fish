#!/usr/local/bin/fish

# fishのpackage managerをインストール
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

# config をセット
ln -s ~/.dotfiles/fish/config.fish ~/.config/fish

# (https://github.com/fisherman/z)
fisher z
# (https://github.com/fisherman/fzf)
fisher fzf
# fishでもbashがうごくようにする(https://github.com/edc/bass)
fisher edc/bass
# (https://github.com/omf/theme-bobthefish)
fisher omf/theme-bobthefish
# nodeの補完が効く(https://github.com/oh-my-fish/plugin-node)
# fisher oh-my-fish/plugin-node
# gemの補完がきく(https://github.com/oh-my-fish/plugin-gem)
fisher oh-my-fish/plugin-gem
# nestしたssh_configを補完できるように
fisher masa0x80/complete_ssh_host.fish
