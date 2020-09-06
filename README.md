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

| Column                 | Type   | Options   |
| ---------------------- | ------ | --------- |
| nickname               | string | null:false|
| email                  | string | null:false|
| password               | string | null:false|
| password_confirmation  | string | null:false|
| family_name            | string | null:false|
| last_name              | string | null:false|
| family_name_kana       | string | null:false|
| last_name_kana         | string | null:false|
| birthday               | date   | null;false|


### Association

- has_many :items
- has_many :purchases

## items　テーブル　商品

| Column                 | Type      | Options                       |
| ---------------------- | --------- | ----------------------------- |
| name                   | string    | null:false                    |
| comment                | text      | null:false                    |
| price                  | integer   | null:false                    |
| user                   | references| null:false, foreign_key: true |
| status_id              | integer   | null:false                    |
| category_id            | integer   | null:false                    |
| delivery_fee_id        | integer   | null:false                    |
| area_of_delivery_id    | integer   | null:false                    |
| days_until_shipping_id | integer   | null:false                    |

### Association
- belongs_to :user
- has_one    :purchase

##　purchases　テーブル 購入
| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
| user            | references| null:false, foreign_key: true |
| item            | references| null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs    :item
- has_one    :shippingaddress

## shippingaddress テーブル　配送先

| Column          | Type      | Options                       |
| --------------- | --------- | ----------------------------- |
| postal code     | string    | null:false                    |
| municipalities  | string    | null:false                    |
| prefectures_id  | integer   | null:false                    |
| address         | string    | null:false                    |
| building_name   | string    |                               |
| phone_number    | string    | null:false                    |
| purchase        | references| null:false, foreign_key: true |

### Association
belongs_to :purchase