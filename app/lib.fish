# 各 install.fish から source される共通ヘルパ。
# Apple Silicon (/opt/homebrew) と Intel (/usr/local) のどちらでも動くよう
# パスは brew --prefix から動的に解決する。
#
# Phase:
#   ask  : 質問だけ集める。実行系は一切しない。
#   run  : 質問なしで実行。
#   未設定: 単体実行（従来の対話）。
#
# アプリインストール (brew/cask/mas) は setup.sh が最初に一括質問する
# 「app をインストールしますか？」の答え (DOTFILES_INSTALL_APPS) に従う。

function dot_brew_prefix
    if test -d /opt/homebrew
        echo /opt/homebrew
    else
        echo /usr/local
    end
end

function dot_phase_is_ask
    set -q DOTFILES_PHASE; and test "$DOTFILES_PHASE" = ask
end

function dot_phase_is_run
    set -q DOTFILES_PHASE; and test "$DOTFILES_PHASE" = run
end

function dot_confirm
    set -l q $argv[1]
    if dot_phase_is_ask
        if set -q DOTFILES_ASKED; and test -f $DOTFILES_ASKED; and grep -Fxq "$q" $DOTFILES_ASKED
            return 1
        end
        if set -q DOTFILES_ASKED
            echo "$q" >> $DOTFILES_ASKED
        end
        if not isatty stdin
            return 1
        end
        read -P (set_color yellow)"❓ "(set_color normal)"$q [y/N]: " -l ans
        if test "$ans" = y -o "$ans" = Y
            if set -q DOTFILES_ANSWERS
                echo "$q" >> $DOTFILES_ANSWERS
            end
        end
        return 1
    end
    if dot_phase_is_run
        if set -q DOTFILES_ANSWERS; and test -f $DOTFILES_ANSWERS; and grep -Fxq "$q" $DOTFILES_ANSWERS
            return 0
        end
        return 1
    end
    if not isatty stdin
        echo "  [skip] $q (非対話シェル)"
        return 1
    end
    read -P (set_color yellow)"❓ "(set_color normal)"$q [y/N]: " -l ans
    test "$ans" = y -o "$ans" = Y
end

function dot_ensure_symlink
    if dot_phase_is_ask
        return 0
    end
    set -l src $argv[1]
    set -l dst $argv[2]
    set -l invalid (find -L $dst -type l 2>/dev/null)
    if not test -L $dst; or test -n "$invalid"
        rm -f $dst
        mkdir -p (dirname $dst)
        ln -s $src $dst
        echo "  linked: $dst -> $src"
    end
end

# アプリ install を実行してよいか
# run フェーズ → DOTFILES_INSTALL_APPS が立っていれば許可
# 単体実行    → 常に許可（個別実行は意思表示とみなす）
function dot_apps_allowed
    if dot_phase_is_run
        set -q DOTFILES_INSTALL_APPS
        return $status
    end
    if dot_phase_is_ask
        return 1
    end
    return 0
end

function dot_brew_install
    set -l pkg $argv[1]
    if dot_phase_is_ask
        return 0
    end
    if brew list --formula 2>/dev/null | grep -qE "^$pkg\$"
        brew upgrade $pkg 2>/dev/null
    else if dot_apps_allowed
        brew install $pkg
    end
end

function dot_brew_cask_install
    set -l cask $argv[1]
    set -l app_path ""
    if set -q argv[2]
        set app_path $argv[2]
    end
    if dot_phase_is_ask
        return 0
    end
    set -l installed 0
    if test -n "$app_path"; and test -e "$app_path"
        set installed 1
    else if brew list --cask 2>/dev/null | grep -qE "^$cask\$"
        set installed 1
    end
    if test $installed -eq 0; and dot_apps_allowed
        brew install --cask $cask
    end
end

function dot_mas_install
    set -l id $argv[1]
    if dot_phase_is_ask
        return 0
    end
    if mas list 2>/dev/null | grep -qE "^$id\s"
        return 0
    end
    if dot_apps_allowed
        mas install $id
    end
end
