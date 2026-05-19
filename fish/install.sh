#!/bin/sh
echo "Start install fish"

DIR=$(cd "$(dirname "$0")"; pwd)

phase_is_ask() { [ "$DOTFILES_PHASE" = "ask" ]; }
phase_is_run() { [ "$DOTFILES_PHASE" = "run" ]; }

# /etc/shells 登録など、フラグに紐づかない個別質問用。
confirm() {
  q=$1
  if phase_is_ask; then
    if [ -n "$DOTFILES_ASKED" ] && [ -f "$DOTFILES_ASKED" ] && grep -Fxq "$q" "$DOTFILES_ASKED"; then
      return 1
    fi
    [ -n "$DOTFILES_ASKED" ] && echo "$q" >> "$DOTFILES_ASKED"
    printf "❓ %s [y/N]: " "$q"
    read ans
    case "$ans" in
      y|Y) [ -n "$DOTFILES_ANSWERS" ] && echo "$q" >> "$DOTFILES_ANSWERS" ;;
    esac
    return 1
  fi
  if phase_is_run; then
    [ -n "$DOTFILES_ANSWERS" ] && [ -f "$DOTFILES_ANSWERS" ] && grep -Fxq "$q" "$DOTFILES_ANSWERS" && return 0
    return 1
  fi
  printf "❓ %s [y/N]: " "$q"
  read ans
  case "$ans" in
    y|Y) return 0 ;;
  esac
  return 1
}

# fish 環境構築に必須なため、確認なしで install / upgrade する。
brew_ensure() {
  pkg=$1
  if brew list --formula 2>/dev/null | grep -qE "^${pkg}\$"; then
    phase_is_ask && return 0
    brew upgrade "$pkg" 2>/dev/null || true
  elif ! phase_is_ask; then
    brew install "$pkg"
  fi
}

ensure_link() {
  phase_is_ask && return 0
  src=$1
  dst=$2
  if [ ! -L "$dst" ] || [ -n "$(find -L "$dst" -type l 2>/dev/null)" ]; then
    rm -f "$dst"
    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
  fi
}

brew_ensure fish
brew_ensure jq
brew_ensure fzf

# fish のパスは Apple Silicon (/opt/homebrew) と Intel (/usr/local) で異なるため動的に解決。
FISH=$(command -v fish)
if [ -n "$FISH" ] && ! grep -qE "^${FISH}$" /etc/shells; then
  if phase_is_ask; then
    confirm "$FISH を /etc/shells に登録しますか？ (sudo)" || true
  elif confirm "$FISH を /etc/shells に登録しますか？ (sudo)"; then
    sudo -- sh -c "echo $FISH >> /etc/shells"
  fi
fi

ensure_link "$DIR/config.fish"        "$HOME/.config/fish/config.fish"
ensure_link "$DIR/conf.d/local.fish"  "$HOME/.config/fish/conf.d/local.fish"

fish "$DIR/init.fish"
