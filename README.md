# .dotfiles

macOS 用個人 dotfiles。Apple Silicon / Intel どちらでも動作する。

## Get Started

```sh
curl https://raw.githubusercontent.com/tanmen/.dotfiles/main/install.sh | sh
```

## 構成

| パス                  | 役割                                                         |
| --------------------- | ------------------------------------------------------------ |
| `setup.sh`            | エントリポイント。質問 → 実行の 2 フェーズで流す。            |
| `fish/`               | fish 本体・config・fisher プラグインのセットアップ。         |
| `app/lib.fish`        | 各 install.fish が source する共通ヘルパ。                    |
| `app/<name>/`         | アプリ単位のディレクトリ。`install.fish` を必ず置く。        |
| `app/setup.fish`      | `app/**/install.fish` を一括実行。                           |

## 2フェーズ実行 (setup.sh)

長いインストール中に対話で詰まらないよう、最初にまとめて質問してから
黙々と実行する。Phase 1 で出る質問は最大 3 つ:

1. `app をインストールしますか？` (GUI / CLI / App Store すべてを一括許可)
2. `<fish のパス> を /etc/shells に登録しますか？ (sudo)`
3. `git-utils (tanmen/git-utils) を ~/.bin に clone しますか？`

fish / jq / fzf は環境構築の前提なので確認なしで install / upgrade される。

### Phase 1: `DOTFILES_PHASE=ask`

質問だけ集める。実行系は一切走らない。
答えは `$DOTFILES_ANSWERS` と環境変数 `DOTFILES_INSTALL_APPS` に記録。

### Phase 2: `DOTFILES_PHASE=run`

Phase 1 の答えに従って実際にインストール・symlink 整備を行う。
**対話は出ない** ので長尺の brew install / upgrade を放置できる。

## 個別実行モード

```fish
fish ~/.dotfiles/app/<name>/install.fish
```

`DOTFILES_PHASE` が未設定なので、未インストールのものは従来通り対話する。

## メモ

- 設定ファイルは原則 `~/` 配下に symlink を張る形で展開する
- `app/gnupg/gpg-agent.conf` だけは pinentry のパスが環境依存のため、
  テンプレ (`gpg-agent.conf.template`) から実ファイルを生成する
- Phase 1 で `/etc/shells` 登録を n とした場合、後から手動で:
  `sudo sh -c "echo $(which fish) >> /etc/shells"`
