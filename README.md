# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル　

| Column    | Type   | Options   |
| --------- | ------ | --------- |
| nickname  | string | null:false|
| email     | string | null:false|
| password  | string | null:false|
| name      | string | null:false|
| name kana | string | null:false|

### Association

- has_many :item
- has_many :purchase

## items　テーブル　商品

| Column            | Type   | Options   |
| ----------------- | ------ | --------- |
| name              | string | null:false|
| comment           | text   | null:false|
| category          | string | null:false|
| status            | string | null:false|
| delivery fee      | string | null:false|
| area of delivery  | string | null:false|
| days unil delivery| integer| null:false|
| price             | integer| null:false|
| users_id          | string | null:false|

### Association
- belongs_to :user
- has_one    :purchase

##　purchases　テーブル 購入
| Column          | Type   | Options   |
| --------------- | ------ | --------- |
| credit card     | string | null:false|
| expiration date | string | null:false|
| security        | string | null:false|
| users_id        | string | null:false|
| items_id        | string | null:false|

### Association
- belongs_to :user
- belongs_to :item
- has_one    :sippingaddres

## sippingaddres テーブル　配送先

| Column          | Type   | Options   |
| --------------- | ------ | --------- |
| postal code     | string | null:false|
| prefectures     | string | null:false|
| municipalities  | string | null:false|

### Association
belongs_to :purchase