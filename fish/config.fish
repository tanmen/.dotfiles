# gettext
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

# elixir exenv (cant fish)
set -g fish_user_paths "$HOME/.exenv/bin" $fish_user_paths
# eval (exenv init - | source)
eval (exenv init - | bash)

# ruby
set -g fish_user_paths "$HOME/.rbenv/bin" $fish_user_paths
eval (rbenv init - | source)

# nodenv
status --is-interactive; and source (nodenv init -|psub)

# java
set -g fish_user_paths (string join / (/usr/libexec/java_home -v 9) bin) $fish_user_paths
