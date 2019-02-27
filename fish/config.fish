# color
export LSCOLORS=gxfxcxdxbxegedabagacad

# gettext
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

# anyenv
set -g fish_user_paths $HOME/.anyenv/bin $fish_user_paths
status --is-interactive; and source (anyenv init - fish|psub)

# rubyのalias
set -gx GEM_ROOT (ruby -e 'print Gem.user_dir')

# java
set -gx JAVA_HOME (/usr/libexec/java_home)
set -g fish_user_paths (string join / (/usr/libexec/java_home -v 1.8) bin) $fish_user_paths

# openssl
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib" $LDFLAGS
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include" $CPPFLAGS
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl/lib/pkgconfig" $PKG_CONFIG_PATH

# mysql
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/mysql-client/lib" $LDFLAGS
set -gx CPPFLAGS "-I/usr/local/opt/mysql-client/include" $CPPFLAGS

# Tools
set -g fish_user_paths $HOME/Tools/git-utils $fish_user_paths
