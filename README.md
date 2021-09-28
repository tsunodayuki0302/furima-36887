# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items

## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| product_name        | string  | null: false |
| product_description | text    | null: false |
| category            | integer | null: false |
| product_condition   | integer | null: false |
| shipping_charges    | integer | null: false |
| shipping_area       | integer | null: false |
| days_to_ship        | integer | null: false |
| selling_price       | integer | null: false |

### Association

- belongs_to :users

## purchase_record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| users  | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :shipping_address


## shipping_address テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| telephone_number    | string     | null: false                    |
| postal_code         | integer    | null: false                    |
| prefectures         | string     | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| purchase_record     | references | null: false, foreign_key: true |


### Association

- has_one :purchase_record