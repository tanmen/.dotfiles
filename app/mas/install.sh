#!/bin/sh
echo "Start install mas"

if [ ! $(brew list | grep -E "^mas\$") ]; then
  brew install mas
else
  brew upgrade mas
fi

# Xcode
if [[ ! $(mas list | grep -E "^497799835\s") ]]; then
  mas install 497799835
else
  mas upgrade 497799835
fi

# Fantastical
if [[ ! $(mas list | grep -E "^975937182\s") ]]; then
  mas install 975937182
else
  mas upgrade 975937182
fi

# Spark
if [[ ! $(mas list | grep -E "^1176895641\s") ]]; then
  mas install 1176895641
else
  mas upgrade 1176895641
fi

# Microsoft To Do
if [[ ! $(mas list | grep -E "^1274495053\s") ]]; then
  mas install 1274495053
else
  mas upgrade 1274495053
fi
