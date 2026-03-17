FactoryBot.define do
  factory :purchase_form do
    postal_code { '123-4567' }
    origin_region_id { 2 }
    city { '東京都' }
    street_address { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
