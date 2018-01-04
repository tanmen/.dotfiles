# gettext
set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths

# elixir exenv (cant fish)
set -g fish_user_paths "$HOME/.exenv/bin" $fish_user_paths
# eval (exenv init - | source)
eval exenv init - | eval

# ruby
set -g fish_user_paths "$HOME/.rbenv/bin" $fish_user_paths
eval (rbenv init - | source)
