FactoryBot.define do
  factory :product do
    product_name { 'たいせい' }
    product_description { '状態よし' }
    price { 500 }
    product_condition_id { 4 }
    shipping_fee_responsibility_id { 2 }
    origin_region_id { 4 }
    shipping_days_id { 4 }
    category_id { 4 }
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open(Rails.root.join('spec/fixtures/files/タスク着手順序.png')), filename: 'タスク着手順序.png',
                           content_type: 'image/png')
    end
  end
end
