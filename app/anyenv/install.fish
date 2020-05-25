#!/usr/local/bin/fish
echo (set_color blue)           Start install anyenv(set_color normal)

if not brew list | grep -E "^anyenv\$"
  brew install anyenv
else
  brew upgrade anyenv
end

status --is-interactive; and source (anyenv init -|psub)

if [ ! -d (anyenv root)/plugins ]
  mkdir -p (anyenv root)/plugins
else
  echo "(anyenv root)/plugins already exists"
end

if [ ! -d (anyenv root)/plugins/anyenv-update ]
  git clone https://github.com/znz/anyenv-update.git (anyenv root)/plugins/anyenv-update
else
  echo "(anyenv root)/plugins/anyenv-update already exists"
end

if [ ! -d ~/.config/anyenv/anyenv-install ]
  anyenv install --init
end

if not anyenv version | grep -E "^exenv:"
  anyenv install exenv
end

if not anyenv version | grep -E "^rbenv:"
  anyenv install rbenv
end

if not anyenv version | grep -E "^nodenv:"
  anyenv install nodenv
end

if not anyenv version | grep -E "^goenv:"
  anyenv install goenv
end

status --is-interactive; and source (anyenv init -|psub)

if [ ! -d (nodenv root)/plugins/jetbrains-npm ]
  git clone https://github.com/nodenv/jetbrains-npm (nodenv root)/plugins/jetbrains-npm
else
  echo "(nodenv root)/plugins/jetbrains-npm already exists"
end