# java (17があれば設定)
set -l java17 (/usr/libexec/java_home -v 17 2>/dev/null)
if test -n "$java17"
    set -gx JAVA_HOME $java17
end

# vscode
fish_add_path -gP '/Applications/Visual Studio Code.app/Contents/Resources/app/bin'

# fork
alias fork='/Applications/Fork.app/Contents/Resources/fork_cli'
