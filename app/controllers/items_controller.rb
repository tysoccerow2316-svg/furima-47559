class ProductsController < ApplicationController
  def index
  end

  def product_params
    params.require(:product).permit(:image).merge(user_id: current_user.id)
  end

  def new
  end
end
