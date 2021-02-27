# テーブル設計

## users テーブル

| Column             | Type    | Options                |
| ------------------ | ------- | ---------------------- |
| nickname           | string  | null:false             |
| email              | string  | null:false,unique:true |
| encrypted_password | string  | null:false             |
| last_name          | string  | null:false             |
| first_name         | string  | null:false             |
| last_name_kana     | string  | null:false             |
| first_name_kana    | string  | null:false             |
| birthday           | date    | null:false             |

### Association
- has_many :items
- has_many :purchases
- has_many :comments


## items テーブル(出品情報)

| Column              | Type                 | Options          |
| ------------------- | -------------------- | ---------------- |
| name                | string               | null: false      |
| info                | text                 | null: false      |
| category            | string               | null: false      |
| sales_status        | string               | null: false      |
| shipping_fee_status | string               | null: false      |
| prefecture          | string               | null: false      |
| scheduled_delivery  | string               | null: false      |
| price               | integer              | null: false      |
| user                | references           | foreign_key:true |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments

## purchases テーブル(購入情報)

| Column                | Type                 | Options          |
| --------------------- | -------------------- | ---------------- |
| user                  | references           | foreign_key:true |
| item                  | references           | foreign_key:true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :recipient

## recipients テーブル(配送情報)

| Column       | Type       | Options          |
| ------------ | ---------- | ---------------- |
| postal_code  | integer    | null: false      |
| prefecture   | string     | null: false      |
| city         | string     | null: false      |
| address      | string     | null: false      |
| buillding    | string     | null: false      |
| phone_number | integer    | null: false      |
| purchase     | references | foreign_key:true |

### Association
- belongs_to :user
- belongs_to :purchase

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | null: false |
| item      | references | null: false |

### Association
- has_many :purchases
- has_many :comments