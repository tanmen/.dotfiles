#!/usr/bin/env fish
set DIR (dirname (status --current-filename))
echo "------------ application setup ($DOTFILES_PHASE) ------------"

# DOTFILES_PHASE (ask/run) は呼び出し元 (setup.sh) で設定済み。
# ask フェーズなら質問だけ。run フェーズで実際にインストール実行。

find $DIR -name install.fish -exec fish {} \;
