class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :product_description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_fee_responsibility_id, numericality: { other_than: 1 }
  validates :origin_region_id, numericality: { other_than: 1 }
  validates :shipping_days_id, numericality: { other_than: 1 }
  validates :category_id, numericality: { other_than: 1 }
  belongs_to :user
end
