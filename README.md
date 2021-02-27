# テーブル設計

## users テーブル

| Column          | Type    | Options                |
| --------------- | ------- | ---------------------- |
| nickname        | string  | null:false             |
| email           | string  | null:false,unique:true |
| password        | string  | null:false             |
| last_name       | string  | null:false             |
| first_name      | string  | null:false             |
| last_name_kana  | string  | null:false             |
| first_name_kana | string  | null:false             |
| birth_year      | integer | null:false             |
| birth_mont      | integer | null:false             |
| birth_day       | integer | null:false             |

## items テーブル(出品情報)

| Column              | Type                 | Options          |
| ------------------- | -------------------- | ---------------- |
| image               | ActiveStorageで実装   | null: false      |
| name                | string               | null: false      |
| info                | text                 | null: false      |
| category            | string               | null: false      |
| sales_status        | string               | null: false      |
| shipping_fee_status | string               | null: false      |
| prefecture          | string               | null: false      |
| scheduled_delivery  | string               | null: false      |
| price               | integer              | null: false      |
| user                | references           | foreign_key:true |

## purchases テーブル(購入情報)

| Column                | Type                 | Options          |
| --------------------- | -------------------- | ---------------- |
| user                  | references           | foreign_key:true |
| item                  | references           | foreign_key:true |

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

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references | null: false |
| item      | references | null: false |
