#!/usr/local/bin/fish
echo (set_color blue)           Start install docker(set_color normal)

if [ ! -e /Applications/Docker.app ]
  brew install --cask docker
end