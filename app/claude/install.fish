#!/usr/bin/env fish
echo (set_color blue)"          Start install claude"(set_color normal)

set DIR (dirname (status --current-filename))
source $DIR/../lib.fish

if not dot_phase_is_ask
    mkdir -p ~/.claude
end

for name in settings.json statusline-command.sh
    dot_ensure_symlink $DIR/$name ~/.claude/$name
end
