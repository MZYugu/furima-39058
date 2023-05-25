# テーブル設計

## users

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null :false |
| email              | string  | null :false, unique: true |
| encrypted_password | string  | null :false |
| lastname_kanji     | string  | null :false |
| firstname_kanji    | string  | null :false |
| lastname_katakana  | string  | null :false |
| firstname_katakana | string  | null :false |
| birth_day          | date    | null :false |

### Association
- has_many :items
- has_many :orders

## items

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null :false                    |
| price        | integer    | null :false                    |
| text         | text       | null :false                    |
| category     | integer    | null :false                    |
| item_status  | integer    | null :false                    |
| postage_bare | integer    | null :false                    |
| prefectures  | integer    | null :false                    |
| days_ship    | integer    | null :false                    |
| user         | references | null :false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null :false, foreign_key: true |
| user    | references | null :false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_code   | string     | null :false                    |
| prefectures | integer    | null :false                    |
| cities      | string     | null :false                    |
| address     | string     | null :false                    |
| building    | string     |                                |
| tel_number  | string     | null :false                    |
| order       | references | null :false, foreign_key: true |

### Association
- belongs_to :order