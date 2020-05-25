#!/usr/local/bin/fish
echo (set_color blue)           Start install rustup(set_color normal)

if not brew list | grep -E "^rustup-init\$"
  brew install rustup
  rustup-init
else
  brew upgrade rustup
end

