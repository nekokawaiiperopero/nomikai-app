# 飲み会アプリ - プロジェクト設定

## 概要
飲み会を便利にするWebアプリケーション。

## 技術スタック
- HTML / CSS / JavaScript（単一HTMLファイル構成）
- 外部ライブラリはCDN経由のみ
- データ永続化は localStorage

## 開発ルール
- UIは日本語
- レスポンシブ対応必須（モバイルファースト）
- CSS変数でカラー管理、ダークモード対応推奨
- 関数には日本語コメント必須
- localStorageキーは `nomikai-app-` プレフィックスを使用

## フォルダ構成
```
飲み会アプリ/
├── CLAUDE.md          # このファイル（プロジェクト設定）
├── .claude/           # Claude Code設定
│   └── launch.json    # プレビューサーバー設定
├── app/               # アプリ本体（HTMLファイル群）
├── docs/              # プロジェクト解説文書
└── .gitignore         # Git除外設定
```

## コマンド
- プレビュー: `.claude/launch.json` の `nomikai-app` で起動
- HTMLファイルはブラウザで直接開いても動作する
