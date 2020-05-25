#!/usr/local/bin/fish
set DIR (dirname (status --current-filename))
echo "------------ application setup ------------"

find $DIR -name install.fish -exec fish {} \;
