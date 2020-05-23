#!/bin/sh
echo "Start install rust"

if [ ! $(brew list | grep -E "^rustup-init\$") ]; then
  brew install rustup
  rustup-init
else
  brew upgrade rustup
fi

