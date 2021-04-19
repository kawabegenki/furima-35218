# README


# README

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
- has_one    :account

## accounts テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_cord   | string     | null: false |
| pay_from      | string     | null: false |
| city          | string     | null: false |
| addresses     | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |

### Association
- belongs_to :account