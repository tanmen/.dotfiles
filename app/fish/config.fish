# color
set -gx LSCOLORS gxfxcxdxbxegedabagacad

# gpg
set -gx GPG_TTY (tty)

# gettext
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

# goenv
set -gx GOENV_GOPATH_PREFIX $HOME/.go

# anyenv
status --is-interactive; and source (anyenv init -|psub)

# rustup
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths

# rubyのalias
set -gx GEM_ROOT (ruby -e 'print Gem.user_dir')

# java
set -gx JAVA_HOME (/usr/libexec/java_home)
set -g fish_user_paths (string join / (/usr/libexec/java_home -v 14) bin) $fish_user_paths

# android
set -gx ANDROID_HOME $HOME/Library/Android/sdk
set -g fish_user_paths $ANDROID_HOME/tools $fish_user_paths
set -g fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths

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

# go
set -g fish_user_paths $GOROOT/bin $fish_user_paths
set -g fish_user_paths $GOPATH/bin $fish_user_paths

# sbin
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
