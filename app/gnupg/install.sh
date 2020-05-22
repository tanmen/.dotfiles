#!/bin/sh
echo "Start install gnupg"

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ ! $(brew list | grep -E "^gnupg\$") ]; then
  brew install gnupg
else
  brew upgrade gnupg
fi

if [ ! $(brew list | grep -E "^pinentry-mac\$") ]; then
  brew install pinentry-mac
else
  brew upgrade pinentry-mac
fi

if [ ! -L ~/.gnupg/gpg-agent.conf ] || [[ -n $(find -L ~/.gnupg/gpg-agent.conf -type l) ]]; then
  rm -f ~/.gnupg/gpg-agent.conf
  ln -s $SCRIPT_DIR/gpg-agent.conf ~/.gnupg/gpg-agent.conf
fi

if [ ! -L ~/.gnupg/gpg.conf ] || [[ -n $(find -L ~/.gnupg/gpg.conf -type l) ]]; then
  rm -f ~/.gnupg/gpg.conf
  ln -s $SCRIPT_DIR/gpg.conf ~/.gnupg/gpg.conf
fi
