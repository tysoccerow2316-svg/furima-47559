users テーブル

|Column|Type|Options|
|name|string|null: false|
|email|string|null: false,unique:true|
|encrypted_password|integer|null: false|
|encrypted_password_confirmation|integer|null: false|
|name_full_width|string|null: false|
|name_kana_half_width|string|null: false|
|date_of_birth|integer|null: false|

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
|user_id|integer |null: false,foreign_key: true|

belongs_to :user
has_one :purchase_records


purchase_recordsテーブル

|Column|Type|Options|
| buyer_id        | references | null: false, foreign_key: true | # references :users
| purchased_item_id| references | null: false, foreign_key: true | # references :users

belongs_to :products
has_one :shipping_address


shipping_addressesテーブル

|Column|Type|Options|
|postal_code|string|null: false|
|origin_region|string|null: false|
|city| string|null: false|
|street_address|string|null: false|
|building_name|string|null: true|
|phone_number|string|null: false|
| purchase_history_records_id | integer | null: false, foreign_key: true |

belongs_to :purchase_record