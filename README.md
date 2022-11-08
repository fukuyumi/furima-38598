# テーブル設計


## users テーブル

|Column              |Type    |Options                  |
|--------------------|--------|-------------------------|
| nickname           | string | null:false              |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |
| first_name         | string | null:false              |
| last_name          | string | null:false              |
| first_name_kana    | string | null:false              |
| last_name_kana     | string | null:false              |
| birthday           | date   | null:false              |


### Association
has_many :items
has_many :orders
has_many :orders_addresses

## items テーブル

|Column              |Type       |Options                       |
|--------------------|-----------|------------------------------|
| item_name          | string    | null:false                   |
| item_description   | text      | null:false                   |
| category           | integer   | null:false                   |
| item_status        | integer   | null:false                   |
| ship_charge        | integer   | null:false                   |
| sender_area        | integer   | null:false                   |
| ship_date          | integer   | null:false                   |
| price              | integer   | null:false                   |
| user               | reference | null:false, foreign_key:true |

### Association
belongs_to :user
has_one :order
belongs_to :order_address

## orders テーブル

|Column|Type       |Options                       |
|------|-----------|------------------------------|
| user | reference | null:false, foreign_key:true |
| item | reference | null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :item
has_one :order_address

## order_addresses テーブル

|Column              |Type       |Options                       |
|--------------------|-----------|------------------------------|
| postcode           | integer   | null:false                   |
| prefecture         | string    | null:false                   |
| city               | string    | null:false                   |
| block              | integer   | null:false                   |
| building           | string    |                              |
| phone_number       | string    | null:false                   |
| user               | reference | null:false, foreign_key:true |
| item               | integer   | null:false, foreign_key:true |

### Association
belong_to :order