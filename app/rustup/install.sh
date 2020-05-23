#!/bin/sh
echo "Start install rust"

if [ ! $(brew list | grep -E "^rustup\$") ]; then
  brew install rustup
else
  brew upgrade rustup
fi

