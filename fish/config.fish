# gettext
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

# rubyのalias
set GEM_ROOT (ruby -e 'print Gem.user_dir')

# elixir exenv (cant fish)
set -g fish_user_paths "$HOME/.exenv/bin" $fish_user_paths
eval (exenv init - | bash)

# ruby
status --is-interactive; and source (rbenv init -|psub)

# nodenv
status --is-interactive; and source (nodenv init -|psub)

# go
status --is-interactive; and source (goenv init -|psub)

# java
set -x JAVA_HOME (/usr/libexec/java_home)
set -g fish_user_paths (string join / (/usr/libexec/java_home -v 1.8) bin) $fish_user_paths
