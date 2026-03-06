class Shipping_days < ActiveHash::Base
  self.data = []
  belongs_to_active_hash :shipping_days
end
