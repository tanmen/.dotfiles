#!/usr/local/bin/fish

# fishのpackage managerをインストール
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# config をセット
ln -s ~/.dotfiles/fish/config.fish ~/.config/fish

# (https://github.com/fisherman/z)
fisher add z
# (https://github.com/fisherman/fzf)
fisher add fzf
# fishでもbashがうごくようにする(https://github.com/edc/bass)
fisher add edc/bass
# (https://github.com/omf/theme-bobthefish)
fisher add oh-my-fish/theme-bobthefish
# nestしたssh_configを補完できるように
fisher add masa0x80/complete_ssh_host.fish
