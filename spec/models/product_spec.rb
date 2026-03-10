require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品できる' do
    it 'imageとproduct_name、product_descriptionとprice,
    product_condition_id,shipping_fee_responsibility_id,origin_region_id,shipping_days_id,
    category_idが存在すれば登録できる' do
      expect(@product).to be_valid
    end
  end
  context '商品出品できない' do
    it 'product_nameが空では登録できない' do
      @product.product_name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Product name can't be blank")
    end
    it 'product_descriptionが空では登録できない' do
      @product.product_description = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Product description can't be blank")
    end
    it 'product_condition_idが1では登録できない' do
      @product.product_condition_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Product condition must be other than 1')
    end
    it 'category_idが1では登録できない' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Category must be other than 1')
    end
    it 'shipping_fee_responsibility_idが1では登録できない' do
      @product.shipping_fee_responsibility_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipping fee responsibility must be other than 1')
    end
    it 'origin_region_idが1では登録できない' do
      @product.origin_region_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Origin region must be other than 1')
    end
    it 'shipping_days_idが1では登録できない' do
      @product.shipping_days_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include('Shipping days must be other than 1')
    end
    it 'priceが空では登録できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが¥300円未満では登録できない' do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが¥9999999円以上では出品できない' do
      @product.price = 10_000_000
      @product.valid?
      expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it 'priceは半角数字でなければ出品できない' do
      @product.price = '３００'
      @product.valid?
      expect(@product.errors.full_messages).to include('Price is not a number')
    end
    it 'imageが空では出品できない' do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
  end
end
