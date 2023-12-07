#!/usr/local/bin/fish
echo (set_color blue)           Start install font(set_color normal)

if not brew list --cask | grep -E "^font-fira-mono-for-powerline\$"
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-mono-for-powerline
end
