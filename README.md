# README


# アプリケーション概要

このアプリケーションでできることを記述。

# URL	デプロイ済みのURLを記述。

デプロイが済んでいない場合は、デプロイが完了次第記述すること。

# テスト用アカウント	

ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。

# 利用方法	
このアプリケーションの利用方法を記述。

# 目指した課題解決	
このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。

# 洗い出した要件	
スプレッドシートにまとめた要件定義を記述。

# 実装した機能についての画像やGIFおよびその説明	
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

# 実装予定の機能	
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

# データベース設計	
ER図等を添付。

# ローカルでの動作方法	
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。



# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| first_name            | string | null: false               |
| last_name             | string | null: false               |
| first_read            | string | null: false               |
| last_read             | string | null: false               |
| birthday              | date   | null: false               |


### Association
- has_many : items
- has_many : histories

## items テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| title         | string      | null: false                    |
| price         | integer     | null: false                    |
| content       | text        | null: false                    |
| category_id   | integer     | null: false                    |
| state_id      | integer     | null: false                    |
| charge_id     | integer     | null: false                    |
| from_id       | integer     | null: false                    |
| move_id       | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one    :history


## histories テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :orders

## orders テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_cord   | string     | null: false |
| pay_from      | string     | null: false |
| city          | string     | null: false |
| addresses     | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |
| history       | references | null: false, foreign_key: true |

### Association
- belongs_to :history