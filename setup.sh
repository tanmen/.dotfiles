#!/bin/sh
DIR=$(cd "$(dirname "$0")"; pwd)

# 2フェーズ実行:
#   Phase 1 (ask) - 未インストール項目を最初にまとめて質問する
#   Phase 2 (run) - 集めた答えに従って黙々とインストール・symlink を実施
# 「インストール中の長いプロセス中に対話で詰まる」を避けるための分離。

DOTFILES_ANSWERS=$(mktemp -t dotfiles_answers)
DOTFILES_ASKED=$(mktemp -t dotfiles_asked)
export DOTFILES_ANSWERS DOTFILES_ASKED
trap 'rm -f "$DOTFILES_ANSWERS" "$DOTFILES_ASKED"' EXIT

if ! command -v brew >/dev/null 2>&1; then
  echo "[error] Homebrew が必要です。先にインストールしてから setup.sh を再実行してください:"
  echo "        https://brew.sh"
  exit 1
fi

# directory構成（無人で作成。副作用なし）
for d in ~/Projects ~/Tools ~/Tmp ~/.bin; do
  [ -d "$d" ] || mkdir "$d"
done

if [ ! -e /Library/Developer/CommandLineTools ]; then
  echo "[skip] Xcode Command Line Tools 未インストール。手動で:"
  echo "       xcode-select --install"
  echo "       sudo xcodebuild -license accept"
fi

echo
echo "==> Phase 1/2: インストール項目の確認 (質問は最初だけ)"
echo
export DOTFILES_PHASE=ask
sh "$DIR/fish/install.sh"
fish "$DIR/app/setup.fish"

if [ -s "$DOTFILES_ANSWERS" ]; then
  echo
  echo "==> 以下をインストール対象として記録しました:"
  sed 's/^/    - /' "$DOTFILES_ANSWERS"
else
  echo
  echo "==> 新規インストール対象なし。既存物の更新と symlink の整備のみ行います。"
fi

echo
echo "==> Phase 2/2: 実行 (ここから先は対話なし)"
echo
export DOTFILES_PHASE=run
brew update
sh "$DIR/fish/install.sh"
fish "$DIR/app/setup.fish"

echo
echo "==> Done."

exec $SHELL -l
