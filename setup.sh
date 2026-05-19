#!/bin/sh
DIR=$(cd "$(dirname "$0")"; pwd)

# 2フェーズ実行:
#   Phase 1 (ask) - 必要な質問だけ最初に出す
#   Phase 2 (run) - 集めた答えに従って黙々と実施
#
# 質問は最大3つ:
#   1) app をインストールしますか？ (個別 brew/cask/mas を一括許可)
#   2) /etc/shells に fish を登録しますか？ (sudo)
#   3) git-utils (tanmen/git-utils) を ~/.bin に clone しますか？
# fish/jq/fzf は環境必須なので確認なしで install / upgrade する。

DOTFILES_ANSWERS=$(mktemp -t dotfiles_answers)
DOTFILES_ASKED=$(mktemp -t dotfiles_asked)
export DOTFILES_ANSWERS DOTFILES_ASKED
trap 'rm -f "$DOTFILES_ANSWERS" "$DOTFILES_ASKED"' EXIT

if ! command -v brew >/dev/null 2>&1; then
  echo "[error] Homebrew が必要です。先にインストールしてから setup.sh を再実行してください:"
  echo "        https://brew.sh"
  exit 1
fi

# directory構成（無人で作成）
for d in ~/Projects ~/Tools ~/Tmp ~/.bin; do
  [ -d "$d" ] || mkdir "$d"
done

if [ ! -e /Library/Developer/CommandLineTools ]; then
  echo "[skip] Xcode Command Line Tools 未インストール。手動で:"
  echo "       xcode-select --install"
  echo "       sudo xcodebuild -license accept"
fi

echo
echo "==> Phase 1/2: 質問 (最初にまとめて聞きます)"
echo

# 質問 1: アプリ一括許可
printf "❓ app (GUI アプリ + 関連 CLI + App Store) をインストールしますか？ [y/N]: "
read ans
case "$ans" in
  y|Y) export DOTFILES_INSTALL_APPS=1 ;;
esac

# 質問 2, 3: フェーズ内の confirm を集める (fish/install.sh の /etc/shells, app の git-utils clone)
export DOTFILES_PHASE=ask
sh "$DIR/fish/install.sh"
fish "$DIR/app/setup.fish"

echo
echo "==> 質問への回答サマリ:"
if [ -n "$DOTFILES_INSTALL_APPS" ]; then
  echo "    - app のインストール: yes"
else
  echo "    - app のインストール: no"
fi
if [ -s "$DOTFILES_ANSWERS" ]; then
  sed 's/^/    - /' "$DOTFILES_ANSWERS"
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
