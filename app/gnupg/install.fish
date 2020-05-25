#!/usr/local/bin/fish
echo (set_color blue)           Start install gnupg(set_color normal)

set DIR (dirname (status --current-filename))

if not brew list | grep -E "^gnupg\$"
  brew install gnupg
else
  brew upgrade gnupg
end

if not brew list | grep -E "^pinentry-mac\$"
  brew install pinentry-mac
else
  brew upgrade pinentry-mac
end

set -l INVALID_LINK (find -L ~/.gnupg/gpg-agent.conf -type l)
if [ ! -L ~/.gnupg/gpg-agent.conf ] || [ -n "$INVALID_LINK" ]
  rm -f ~/.gnupg/gpg-agent.conf
  ln -s $DIR/gpg-agent.conf ~/.gnupg/gpg-agent.conf
end

set -l INVALID_LINK (find -L ~/.gnupg/gpg.conf -type l)
if [ ! -L ~/.gnupg/gpg.conf ] || [ -n "$INVALID_LINK" ]
  rm -f ~/.gnupg/gpg.conf
  ln -s $DIR/gpg.conf ~/.gnupg/gpg.conf
end
