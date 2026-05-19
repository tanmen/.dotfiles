# 各 install.fish から source される共通ヘルパ。
# Apple Silicon (/opt/homebrew) と Intel (/usr/local) のどちらでも動くよう
# パスは brew --prefix から動的に解決する。
#
# 2フェーズ実行をサポートする。
#   - DOTFILES_PHASE=ask : 未インストール項目を最初に全て質問。答えを $DOTFILES_ANSWERS に追記。
#                          install/symlink などの実行系アクションは一切しない。
#   - DOTFILES_PHASE=run : ask で集めた答えに従ってインストール実施。確認は一切出さない。
#   - 未セット           : 個別の install.fish を単体実行している扱い。従来通り対話。

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
        # 同じ質問を何度も聞かない
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
        # ask フェーズではどんな答えでも実行系は走らせない
        return 1
    end
    if dot_phase_is_run
        if set -q DOTFILES_ANSWERS; and test -f $DOTFILES_ANSWERS; and grep -Fxq "$q" $DOTFILES_ANSWERS
            return 0
        end
        return 1
    end
    # 単体実行
    if not isatty stdin
        echo "  [skip] $q (非対話シェル)"
        return 1
    end
    read -P (set_color yellow)"❓ "(set_color normal)"$q [y/N]: " -l ans
    test "$ans" = y -o "$ans" = Y
end

function dot_ensure_symlink
    # ask フェーズでは何もしない
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

function dot_brew_install
    set -l pkg $argv[1]
    set -l display $pkg
    if set -q argv[2]
        set display $argv[2]
    end
    set -l installed 0
    if brew list --formula 2>/dev/null | grep -qE "^$pkg\$"
        set installed 1
    end
    if dot_phase_is_ask
        # 質問だけ。既存なら何も聞かない。
        if test $installed -eq 0
            dot_confirm "$display をインストールしますか？" >/dev/null
        end
        return 0
    end
    if test $installed -eq 1
        brew upgrade $pkg 2>/dev/null
    else if dot_confirm "$display をインストールしますか？"
        brew install $pkg
    end
end

function dot_brew_cask_install
    set -l cask $argv[1]
    set -l app_path ""
    set -l display $cask
    if set -q argv[2]
        set app_path $argv[2]
    end
    if set -q argv[3]
        set display $argv[3]
    end
    set -l installed 0
    if test -n "$app_path"; and test -e "$app_path"
        set installed 1
    else if brew list --cask 2>/dev/null | grep -qE "^$cask\$"
        set installed 1
    end
    if dot_phase_is_ask
        if test $installed -eq 0
            dot_confirm "$display をインストールしますか？" >/dev/null
        end
        return 0
    end
    if test $installed -eq 0
        if dot_confirm "$display をインストールしますか？"
            brew install --cask $cask
        end
    end
end

function dot_mas_install
    set -l id $argv[1]
    set -l name $argv[2]
    set -l installed 0
    if mas list 2>/dev/null | grep -qE "^$id\s"
        set installed 1
    end
    if dot_phase_is_ask
        if test $installed -eq 0
            dot_confirm "$name (App Store) をインストールしますか？" >/dev/null
        end
        return 0
    end
    if test $installed -eq 0
        if dot_confirm "$name (App Store) をインストールしますか？"
            mas install $id
        end
    end
end
