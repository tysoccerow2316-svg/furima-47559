class Product < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee_responsibility
  belongs_to :origin_region
  belongs_to :shipping_days

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
  has_many :purchase_records

  def sold_out?
    purchase_records.exists?
  end
end
