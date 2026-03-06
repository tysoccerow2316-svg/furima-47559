class ProductCondition < ActiveHash::Base
  self.data = []

  belongs_to_active_hash :product_condition
end
