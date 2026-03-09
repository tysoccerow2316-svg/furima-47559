class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :product_name, presence: true
  validates :product_description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  validates :product_condition_id, presence: true
  validates :shipping_fee_responsibility_id, presence: true
  validates :origin_region_id, presence: true
  validates :shipping_days_id, presence: true
  validates :category_id, presence: true
  validates :user, presence: true, foreign_key: true
end
