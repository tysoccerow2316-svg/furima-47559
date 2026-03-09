class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_name,              null: false
      t.text :product_description,              null: false
      t.integer :price, null: false
      t.integer :product_condition_id,              null: false
      t.integer :shipping_fee_responsibility_id,              null: false
      t.integer :origin_region_id,              null: false
      t.integer :shipping_days_id,              null: false
      t.integer :category_id,              null: false
      t.references :user,              null: false,foreign_key: true

      t.timestamps
    end
  end
end
