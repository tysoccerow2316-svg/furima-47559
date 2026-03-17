class PurchaseForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  attr_accessor :user_id, :product_id, :postal_code, :origin_region_id, :street_address, :city, :building_name, :phone_number,
                :purchase_record_id, :token

  validates :postal_code, presence: true,
                          format: { with: /\A\d{3}-\d{4}\z/, message: 'は3桁ハイフン4桁で入力してください' }
  validates :origin_region_id, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true,
                           format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数字で入力してください' }
  validates :token, presence: true
  validates :user_id, presence: true
  validates :product_id, presence: true
  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, product_id: product_id)

    ShippingAddress.create(
      postal_code: postal_code,
      origin_region_id: origin_region_id,
      city: city,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number,
      purchase_record_id: purchase_record.id
    )
  end
end
