class PurchaseRecord < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :shipping_address

  validates :user_id, presence: true
  validates :product_id, presence: true
end
