class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :move_to_root

  def index
    @product = Product.find(params[:product_id])
    @purchase_form = PurchaseForm.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_form = PurchaseForm.new(purchase_form_params)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_form_params
    params.require(:purchase_form).permit(
      :postal_code,
      :origin_region_id,
      :street_address,
      :city,
      :building_name,
      :phone_number
    ).merge(
      user_id: current_user.id,
      product_id: params[:product_id]
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_root
    return unless current_user == @product.user || @product.sold_out?

    redirect_to root_path
  end
end
