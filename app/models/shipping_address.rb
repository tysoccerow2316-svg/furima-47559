class ShippingAddress < ApplicationRecord
  belongs_to :purchase_record

  validates :postal_code, presence: true
  validates :origin_region_id, presence: true
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数字で入力してください' }
  validates :purchase_record, presence: true
end
