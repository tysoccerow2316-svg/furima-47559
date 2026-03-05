user テーブル

|Column|Type|Options|
|name|integer|null: false|
|email|string|null: false|
|password|string|null: false|


productsテーブル
|Column|Type|Options|
|image|string|null: false|
|product_name|string|null: false|
|product_description|text|null: false|
|category|integer |null: false|
|product_condition|integer|null: false|
|shipping_fee_responsibility|integer|null: false|
|origin_region| string|null: false|
|shipping_days|string|null: false|
|price|integer|null: false|
|user_id|integer |null: false|


purchase_recordsテーブル
|Column|Type|Options|
|buyer|integer|null: false,外部キー制約|
|purchased_item|integer|null: false,外部キー制約|

shipping_addressesテーブル
|Column|Type|Options|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city| string|null: false|
|street_address|string|null: false|