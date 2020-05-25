#!/bin/sh
echo "Start install fish"

DIR=$(cd $(dirname $0); pwd)

if [ ! $(brew list | grep -E "^fish\$") ]; then
  brew install fish
else
  brew upgrade fish
fi

if [ ! $(brew list | grep -E "^jq\$") ]; then
  brew install jq
else
  brew upgrade jq
fi

if [ ! $(brew list | grep -E "^fzf\$") ]; then
  brew install fzf
else
  brew upgrade fzf
fi

if [ ! $(cat /etc/shells | grep -E '^/usr/local/bin/fish$') ] ; then
  sudo -- sh -c "echo $(which fish) >> /etc/shells"
else
  echo 'skip setup shells fish'
fi

if [ ! -e ~/.config/fish/config.fish ] || [ ! -L ~/.config/fish/config.fish ] || [[ -n $(find -L ~/.config/fish/config.fish -type l) ]]; then
  rm -f ~/.config/fish/config.fish
  ln -s $DIR/config.fish ~/.config/fish/config.fish
fi

fish $DIR/init.fish

