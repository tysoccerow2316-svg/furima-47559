class Category < ActiveHash::Base
  self.data = []
  belongs_to_active_hash :category
end
