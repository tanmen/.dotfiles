#!/usr/local/bin/fish

# fishのpackage managerをインストール
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# (https://github.com/fisherman/z)
if not fisher ls fisherman.z
  fisher install fisherman/z
end

# (https://github.com/fisherman/fzf)
if not fisher ls fisherman.fzf
  fisher install fisherman/fzf
end

# fishでもbashがうごくようにする(https://github.com/edc/bass)
if not fisher ls edc.bass
  fisher install edc/bass
end

# (https://github.com/omf/theme-bobthefish)
if not fisher ls oh-my-fish.theme-bobthefish
  fisher install oh-my-fish/theme-bobthefish
end

# nestしたssh_configを補完できるように
if not fisher ls masa0x80.complete_ssh_host.fish
  fisher install masa0x80/complete_ssh_host.fish
end
