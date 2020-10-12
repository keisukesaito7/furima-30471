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
- has_many :comments

## itemsテーブル

| Column                 | Type        | Option            |
| ---------------------- | ----------- | ----------------- |
| name                   | string      | null: false       |
| info                   | text        | null: false       |
| category_id            | integer     | null: false       |
| sales_status_id        | integer     | null: false       |
| shipping_fee_status_id | integer     | null: false       |
| prefecture_id          | integer     | null: false       |
| scheduled_delivery_id  | integer     | null: false       |
| price                  | integer     | null: false       |
| user                   | references  | foreign_key: true |

### association

- belongs_to :user
- has_one :order
- has_many :comments, dependent: :destroy

## ordersテーブル

| Column  | Type       | Option            |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key :true |
| item    | references | foreign_key :true |

### association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressesテーブル

| Column          | Type        | Option            |
| --------------- | ----------- | ----------------- |
| postal_code     | string      | null: false       |
| prefecture_id   | integer     | null: false       |
| city            | string      | null: false       |
| addresses       | string      | null: false       |
| building        | string      |                   |
| phone_number    | string      | null: false       |
| order           | references  | foreign_key :true |

### association

- belongs_to :order

## comments テーブル

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### association

- belongs_to :user
- belongs_to :item