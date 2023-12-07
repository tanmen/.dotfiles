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

if not anyenv version | grep -E "^nodenv:"
  anyenv install nodenv
  echo 'yarn' > (anyenv root)/envs/nodenv/default-packages
end

status --is-interactive; and source (anyenv init -|psub)