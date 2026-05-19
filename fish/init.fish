#!/usr/bin/env fish

set DIR (dirname (status --current-filename))
test -f $DIR/../app/lib.fish; and source $DIR/../app/lib.fish

# ask フェーズでは fisher / プラグインの取得は行わない（質問対象外）。
# run フェーズ or 単体実行で fish が利用可能になっている前提で動かす。
if dot_phase_is_ask 2>/dev/null
    exit 0
end

# fisher (https://github.com/jorgebucaran/fisher)
# git.io はシャットダウン済みのため GitHub の raw URL を参照する。
if not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher install jorgebucaran/fisher
end

# fisherman organization は解散済み。後継の org/repo に置き換え。
set -l plugins \
    jethrokuan/z \
    patrickf1/fzf.fish \
    edc/bass \
    oh-my-fish/theme-bobthefish \
    masa0x80/complete_ssh_host.fish

for p in $plugins
    if not fisher list | grep -qE "^$p\$"
        fisher install $p
    end
end
