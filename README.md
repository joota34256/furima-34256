# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| first_name_kanji | string | null: false |
| last_name_kanji  | string | null: false |
| first_name_kana  | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| image            | string     | null: false |
| description      | text       | null: false |
| shipping_charge  | string     | null: false |
| shipping_area    | string     | null: false |
| shipping_date    | string     | null: false |
| price            | integer    | null: false |
| state            | string     | null: false |
| user             | references | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user             | references | null: false |
| item             | references | null: false |

- belongs_to :user
- belongs_to :item
- has_one :buyer

## buyers テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| phone_number     | string     | null: false |
| purchase         | references | null: false |

- belongs_to :purchase