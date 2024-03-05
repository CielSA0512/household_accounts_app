# アプリケーション名
- 家計簿.household_accounts_app

# アプリケーション概要
- 手軽に入力できて、ページ遷移をせず、出入金の記録情報を確認・管理できるアプリ

# URL

# テスト用アカウント
- Basic認証ID：ccrow
- Basic認証パスワード：1221
- メールアドレス：ccrow@gmail.com
- パスワード：kira0512
# 利用方法
## 出入金管理機能
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. 新規投稿ボタンから、出入金の内容（日付、入出金、項目、メモ、管理方法、金額）を入力し、投稿する
3. 出入金記録を検索する
4. 出入金記録を集計し、円グラフとする

## ユーザー管理機能
1. トップページ（一覧ページ）のヘッダーからユーザー詳細ページorログアウトを行う

# アプリケーションを作成した背景
学生時代、一人暮らしをしていた時に「自分の収入と支出」「口座や手元にあるお金」「固定費」などを確認・管理したいという悩みがあった。
しかし、家計簿のアプリケーションに挑戦したものの、「家計簿をつけることを継続できない」という課題があった。また、課題分析したところ「入力が大変」「出入金一覧表とそれを集計したグラフのページが分かれていて一目で確認しずらい」ということが真因であると仮説を立てた。
実際、家計簿をエクセルで作成した両親に話を聞いたところ、同様の問題を抱えていることが分かったため、真因を解決するために「手軽に入力できて、ページ遷移をせず、出入金の記録情報を確認・管理できる」アプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1cCfRRZ_d3G68qAAdiRmPlPNY7whKq8kmJTMfHWJ94Ak/edit?usp=sharing

# 実装予定の機能
グーグルフォーム
円グラフ作成機能

# データベース設計

# 画面遷移図

# テーブル設計

## users テーブル

| column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |

### Association

- has_many :spends

## spends テーブル

| column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| day                | date       | null: false |
| spend_id           | integer    | null: false |
| category_id        | integer    | null: false |
| memo               | text       |
| management_id      | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法

# 工夫したポイント