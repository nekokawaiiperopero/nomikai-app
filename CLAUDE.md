# 飲み会エージェント - プロジェクト設定

## 概要
飲み会の幹事がAIエージェントと対話して飲み会を企画し、
参加者への連絡・やりとりをAIに委任するWebアプリケーション。

## 公開URL
https://nekokawaiiperopero.github.io/nomikai-app/

## 主要画面
- S1: トップ画面（APIキー入力・PJ作成・一覧導線）
- S2: ホストチャット画面（AI対話＋左サイドバーで参加者スレッド閲覧）
- S3a: 飲み会一覧画面（これから/過去に分類・削除可能）
- S3b: ダッシュボード画面（参加者管理・通知・精算・一斉通知）
- S4: 参加者チャット画面（AI対話＋グループ通知受信）
- S5: 期限切れ画面

## 技術スタック
- HTML / CSS / JavaScript（単一HTMLファイル構成）
- OpenAI API (gpt-4o-mini)
- Supabase (PostgreSQL) - データ永続化
- GitHub Pages - ホスティング
- Supabase JS SDK (CDN)

## Supabase接続情報
- URL: https://ypdixvgdufiwcktyzfeb.supabase.co
- テーブル: projects, members, chat_messages, notifications

## ドキュメント
- docs/05_ユーザー要求ドキュメント.md - 課題・ストーリー・利用フロー
- docs/06_要件定義書.md - 機能要件・データ設計・画面遷移

## 開発ルール
- UIは日本語
- レスポンシブ対応必須（モバイルファースト）
- CSS変数でカラー管理
- OpenAI APIキーのみlocalStorage保存（端末固有）
- それ以外のデータは全てSupabaseに保存

## フォルダ構成
```
飲み会アプリ/
├── CLAUDE.md                # このファイル
├── index.html               # GitHub Pages用（app/index.htmlのコピー）
├── .claude/                 # Claude Code設定
│   └── launch.json          # プレビューサーバー設定
├── .github/workflows/       # GitHub Actions
│   └── pages.yml            # Pages自動デプロイ
├── app/
│   └── index.html           # アプリ本体（単一HTMLファイル）
├── docs/                    # プロジェクト文書
└── .gitignore
```

## デプロイ
- `main` ブランチにpush → GitHub Actionsで自動デプロイ
- `app/index.html` 編集後は `cp app/index.html index.html` で同期が必要

## コマンド
- ローカルプレビュー: `.claude/launch.json` の `nomikai-app` で起動（ポート3001）
