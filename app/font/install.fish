#!/usr/local/bin/fish
echo (set_color blue)           Start install font(set_color normal)

if not brew list | grep -E "^ricty\$"
  brew tap sanemat/font
  brew install ricty --with-powerline
end

if not brew cask list | grep -E "^font-fira-code\$"
  brew tap homebrew/cask-fonts
  brew cask install font-fira-code
end

if not ls ~/Library/Fonts | grep -E "^Ricty.*\.ttf\$"
  cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
end

fc-cache -vf 1>/dev/null
