require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @purchase_form = FactoryBot.build(
      :purchase_form,
      user_id: @user.id,
      product_id: @product.id
    )
  end

  describe '商品購入' do
    context '購入できるとき' do
      it 'postal_code、origin_region_id、city,street_address,phone_number,token正しく入力されていれば保存できる' do
        expect(@purchase_form).to be_valid
      end

      it 'building_nameが空でも保存できる' do
        @purchase_form.building_name = ''
        expect(@purchase_form).to be_valid
      end
    end

    context '購入できないとき' do
      it 'postal_codeが空だと保存できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁の形式でないと保存できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postal code は3桁ハイフン4桁で入力してください')
      end
      it 'origin_region_idが1だと保存できない' do
        @purchase_form.origin_region_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Origin region must be other than 1')
      end
      it 'cityが空だと保存できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空だと保存できない' do
        @purchase_form.street_address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @purchase_form.phone_number = '090123456'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数字で入力してください')
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @purchase_form.phone_number = '090123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数字で入力してください')
      end
      it 'phone_numberが半角数字以外を含むと保存できない' do
        @purchase_form.phone_number = '0901234abcd'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number は10桁以上11桁以内の半角数字で入力してください')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ保存できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐づいていなければ保存できない' do
        @purchase_form.product_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
