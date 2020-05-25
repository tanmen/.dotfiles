#!/usr/local/bin/fish
echo (set_color blue)           Start install git(set_color normal)

set DIR (dirname (status --current-filename))

if not brew list | grep -E "^git\$"
  brew install git
else
  brew upgrade git
end

set -l INVALID_LINK (find -L ~/.gitconfig -type l)
# gitの設定
if [ ! -L ~/.gitconfig ] || [ -n "$INVALID_LINK" ]
  rm -f ~/.gitconfig
  ln -s $DIR/.gitconfig ~/.gitconfig
end
