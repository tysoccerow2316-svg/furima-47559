users テーブル

|Column|Type|Options|
|name|string|null: false|
|email|string|null: false,unique:true|
|encrypted_password|integer|null: false|
|Last Name|string|null: false|
|First Name|string|null: false|
|Last Name Kana|string|null: false|
|First Name Kana|string|null: false|
|date_of_birth|date|null: false|

has_many :products
has_many :purchase_records



productsテーブル

|Column|Type|Options|
|product_name|string|null: false|
|product_description|text|null: false|
|price|integer|null: false|
|product_condition_id|integer|null: false|
|shipping_fee_responsibility_id|integer|null: false|
|origin_region_id|integer|null: false|
|shipping_days_id|integer|null: false|
|category_id|integer|null: false|
|user|references |null: false,foreign_key: true|

belongs_to :user
has_one :purchase_record


purchase_recordsテーブル

|Column|Type|Options|
| users| references | null: false, foreign_key: true | 
| products| references | null: false, foreign_key: true |
belongs_to :product
has_one :shipping_address


shipping_addressesテーブル

|Column|Type|Options|
|postal_code|string|null: false|
|origin_region_id|integer|null: false|
|city| string|null: false|
|street_address|string|null: false|
|building_name|string|null: true|
|phone_number|string|null: false|
| purchase_history_records | references | null: false, foreign_key: true |

belongs_to :purchase_record