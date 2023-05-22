# テーブル設計

## uses

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null :false |
| email              | string  | null :false |
| encrypted_password | string  | null :false |
| lastname_kanji     | string  | null :false |
| firstname_kanji    | string  | null :false |
| lastname_katakana  | string  | null :false |
| firstname_katakana | string  | null :false |
| birth_year         | integer | null :false |
| birth_month        | integer | null :false |
| birth_day          | integer | null :false |

### Association
- has_many :items
- has_many :orders

## items

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null :false                    |
| price        | integer    | null :false                    |
| text         | text       | null :false                    |
| category     | string     | null :false                    |
| item_status  | string     | null :false                    |
| postage_bare | string     | null :false                    |
| sent_region  | string     | null :false                    |
| days_ship    | string     | null :false                    |
| user         | references | null :false, foreign_key: true |
| order        | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null :false, foreign_key: true |
| user    | references | null :false, foreign_key: true |
| address | references | null :false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_code   | string     | null :false                    |
| prefectures | string     | null :false                    |
| cities      | string     | null :false                    |
| address     | string     | null :false                    |
| building    | string     | null :false                    |
| tel_number  | integer    | null :false                    |
| order       | references | null :false, foreign_key: true |

### Association
- belongs_to :order