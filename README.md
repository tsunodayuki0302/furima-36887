# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------              |
| name               | string | null: false               |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| category_id            | integer    | null: false                    |
| product_condition_id   | integer    | null: false                    |
| shipping_charges_id    | integer    | null: false                    |
| prefectures_id         | integer    | null: false                    |
| days_to_ship_id        | integer    | null: false                    |
| selling_price          | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :shipping_address


## shipping_address テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| telephone_number    | string     | null: false                    |
| postal_code         | string     | null: false                    |
| prefectures         | string     | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| purchase_record     | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_record