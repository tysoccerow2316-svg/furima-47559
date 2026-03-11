class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @products = Product.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :product_name,
                                    :product_description,
                                    :category_id,
                                    :product_condition_id,
                                    :shipping_fee_responsibility_id,
                                    :origin_region_id,
                                    :shipping_days_id,
                                    :price).merge(user_id: current_user.id)
  end
end
