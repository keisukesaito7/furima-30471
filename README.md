# テーブル設計

## usersテーブル

| Column          | Type   | Option      |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_date      | date   | null: false |

### association

- has_many :items
- has_many :orders

## itemsテーブル

| Column              | Type        | Option            |
| ------------------- | ----------- | ----------------- |
| name                | string      | null: false       |
| info                | text        | null: false       |
| category            | integer     | null: false       |
| sales_status        | integer     | null: false       |
| shipping_fee_status | integer     | null: false       |
| prefecture          | integer     | null: false       |
| scheduled_delivery  | integer     | null: false       |
| price               | integer     | null: false       |
| user_id             | references  | foreign_key: true |

### association

- belongs_to :user
- has_one :order

## ordersテーブル

| Column  | Type       | Option            |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key :true |
| item_id | references | foreign_key :true |

### association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル

| Column       | Type        | Option            |
| ------------ | ----------- | ----------------- |
| postal_code  | string      | null: false       |
| prefecture   | integer     | null: false       |
| city         | string      | null: false       |
| addresses    | string      | null: false       |
| building     | string      |                   |
| phone_number | string      | null: false       |
| order_id     | integer     | foreign_key :true |

### association

- belongs_to :order