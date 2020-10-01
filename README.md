# テーブル設計

## usersテーブル

| Column          | Type   | Option   |
| --------------- | ------ | -------- |
| email           | string | NOT NULL |
| password        | string | NOT NULL |
| nickname        | string | NOT NULL |
| first_name      | string | NOT NULL |
| last_name       | string | NOT NULL |
| first_name_kana | string | NOT NULL |
| last_name_kana  | string | NOT NULL |
| birth_date      | date   | NOT NULL |

### association

- has_many :items
- has_many :orders


## itemsテーブル

| Column              | Type       | Option   |
| ------------------- | ---------- | -------- |
| name                | string     | NOT NULL |
| info                | text       | NOT NULL |
| category            | string     | NOT NULL |
| sales_status        | string     | NOT NULL |
| shipping_fee_status | string     | NOT NULL |
| prefecture          | string     | NOT NULL |
| scheduled_delivery  | string     | NOT NULL |
| price               | integer    | NOT NULL |
| user                | references |          |

### association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column       | Type       | Option   |
| ------------ | ---------- | -------- |
| postal_code  | string     | NOT NULL |
| prefecture   | string     | NOT NULL |
| city         | string     | NOT NULL |
| addresses    | string     | NOT NULL |
| building     | string     | NOT NULL |
| phone_number | integer    | NOT NULL |
| user         | references |          |
| item         | references |          |

### association

- belongs_to :user
- belongs_to :item