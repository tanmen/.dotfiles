#!/usr/local/bin/fish
echo (set_color blue)           Start install mas(set_color normal)

if not brew list | grep -E "^mas\$"
  brew install mas
else
  brew upgrade mas
end

# Xcode
if not mas list | grep -E "^497799835\s"
  mas install 497799835
else
  mas upgrade 497799835
end

# Fantastical
if not mas list | grep -E "^975937182\s"
  mas install 975937182
else
  mas upgrade 975937182
end

# Spark
if not mas list | grep -E "^1176895641\s"
  mas install 1176895641
else
  mas upgrade 1176895641
end

# Microsoft To Do
if not mas list | grep -E "^1274495053\s"
  mas install 1274495053
else
  mas upgrade 1274495053
end

# Skitch
if not mas list | grep -E "^425955336\s"
  mas install 425955336
else
  mas upgrade 425955336
fi

# Slack
if [[ ! $(mas list | grep -E "^803453959\s") ]]; then
  mas install 803453959
else
  mas upgrade 803453959
fi
