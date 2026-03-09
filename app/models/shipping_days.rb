class ShippingDays < ActiveHash::Base
  self.data = [
    { id: 1, name: '1~2' },
    { id: 2, name: '2~3' },
    { id: 3, name: '4~7' }
  ]
  belongs_to_active_hash :shipping_days
end
