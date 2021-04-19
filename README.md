# README


# README

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first_name  | string | null: false |
| last_name   | string | null: false |
| first_read  | string | null: false |
| last_read   | string | null: false |
| birth_year  | string | null: false |
| birth_month | string | null: false |
| birth_day   | string | null: false |


### Association
- has_many : items
- has_many : histories

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| image      | text       | null: false                    |
| price      | string     | null: false                    |
| category   | string     | null: false                    |
| state      | string     | null: false                    |
| charge     | string     | null: false                    |
| from       | string     | null: false                    |
| move       | string     | null: false                    |
| user       | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one    :item


## histories テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :account

## accounts テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_num      | string     | null: false                    |
| limit_year    | string     | null: false                    |
| limit_month   | string     | null: false                    |
| security_cord | string     | null: false                    |
| postal_cord   | string     | null: false                    |
| pay_from      | string     | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     | null: true                     |
| phone_number  | string     | null: false                    |

### Association
- belongs_to :account