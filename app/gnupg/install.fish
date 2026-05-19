#!/usr/bin/env fish
echo (set_color blue)"          Start install gnupg"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

dot_brew_install gnupg
dot_brew_install pinentry-mac

# 実行系。ask フェーズではスキップ。
if not dot_phase_is_ask
    set -l pinentry (command -v pinentry-mac)
    if test -n "$pinentry"
        mkdir -p ~/.gnupg
        chmod 700 ~/.gnupg
        sed "s|@@PINENTRY@@|$pinentry|" $DIR/gpg-agent.conf.template > ~/.gnupg/gpg-agent.conf
        chmod 600 ~/.gnupg/gpg-agent.conf
        echo "  generated: ~/.gnupg/gpg-agent.conf (pinentry=$pinentry)"
    else
        echo "  [warn] pinentry-mac が見つからないため gpg-agent.conf は未生成"
    end
end

dot_ensure_symlink $DIR/gpg.conf ~/.gnupg/gpg.conf
