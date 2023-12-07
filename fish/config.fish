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

# gettext
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

# anyenv
status --is-interactive; and source (anyenv init -|psub)

# openssl
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib" $LDFLAGS
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig" $PKG_CONFIG_PATH

# mysql
set -g fish_user_paths "/usr/local/opt/mysql-client@5.7/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/mysql-client@5.7/lib" $LDFLAGS
set -gx CPPFLAGS "-I/usr/local/opt/mysql-client@5.7/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/usr/local/opt/mysql-client@5.7/lib/pkgconfig" $PKG_CONFIG_PATH

# sbin
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
