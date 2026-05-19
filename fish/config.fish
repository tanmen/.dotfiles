# color
set -gx LSCOLORS gxfxcxdxbxegedabagacad

# theme
set -g theme_date_timezone Asia/Tokyo
set -g theme_date_format "+%Y-%m-%d %H:%M:%S"
set -g theme_display_node yes
set -g theme_title_display_path yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no
set -g theme_color_scheme dark

# gpg
set -gx GPG_TTY (tty)

# mise (旧 anyenv)
if command -v mise >/dev/null
    mise activate fish | source
end

# customs
fish_add_path -gP $HOME/.bin $HOME/.local/bin
