# .dotfiles

macOS 用個人 dotfiles。Apple Silicon / Intel どちらでも動作する。
インストールフローは「一括 setup は無人で完走」「個別実行は対話で確認」の 2 モード。

## Get Started

```sh
curl https://raw.githubusercontent.com/tanmen/.dotfiles/master/install.sh | sh
```

## 構成

| パス                  | 役割                                                         |
| --------------------- | ------------------------------------------------------------ |
| `setup.sh`            | エントリポイント。brew update → fish → app の順に流す。      |
| `fish/`               | fish 本体・config・fisher プラグインのセットアップ。         |
| `app/lib.fish`        | 各 install.fish が source する共通ヘルパ。                    |
| `app/<name>/`         | アプリ単位のディレクトリ。`install.fish` を必ず置く。        |
| `app/setup.fish`      | `app/**/install.fish` を一括実行。                           |

## 2フェーズ実行 (setup.sh)

長いインストール中に対話で詰まらないよう、`setup.sh` は 2 フェーズで動く。

### Phase 1: `DOTFILES_PHASE=ask`

未インストール項目について `❓ XXX をインストールしますか？ [y/N]:` を
最初にまとめて聞く。**インストール処理は一切実行しない**。
答え (y) は一時ファイル `$DOTFILES_ANSWERS` に記録される。

### Phase 2: `DOTFILES_PHASE=run`

Phase 1 で y と答えた項目だけを実際にインストール。**対話は出ない**。
既存物の `brew upgrade` と symlink 整備もここで行う。

→ ユーザー操作は Phase 1 のときだけ。Phase 2 はそのまま放置できる。

## 個別実行モード

```fish
fish ~/.dotfiles/app/<name>/install.fish
```

`DOTFILES_PHASE` が未設定なので、その場で 1 件ずつ対話する従来の挙動。

## メモ

- 設定ファイルは原則 `~/` 配下に symlink を張る形で展開する
- `app/gnupg/gpg-agent.conf` だけは pinentry のパスが環境依存のため、
  テンプレ (`gpg-agent.conf.template`) から実ファイルを生成する
- 質問に n と答えた `/etc/shells` への fish 登録 (sudo) などは
  必要に応じて手動で行う: `sudo sh -c "echo $(which fish) >> /etc/shells"`
