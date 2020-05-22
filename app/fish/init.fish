#!/usr/local/bin/fish

# fishのpackage managerをインストール
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# (https://github.com/fisherman/z)
if not test (fisher ls fisherman.z) = fisherman/z
  fisher add fisherman/z
end

# (https://github.com/fisherman/fzf)
if not test (fisher ls fisherman.fzf) = fisherman/fzf
  fisher add fisherman/fzf
end

# fishでもbashがうごくようにする(https://github.com/edc/bass)
if not test (fisher ls edc.bass) = edc/bass
  fisher add edc/bass
end

# (https://github.com/omf/theme-bobthefish)
if not test (fisher ls oh-my-fish.theme-bobthefish) = oh-my-fish/theme-bobthefish
  fisher add oh-my-fish/theme-bobthefish
end

# nestしたssh_configを補完できるように
if not test (fisher ls masa0x80.complete_ssh_host.fish) = masa0x80/complete_ssh_host.fish
  fisher add masa0x80/complete_ssh_host.fish
end
