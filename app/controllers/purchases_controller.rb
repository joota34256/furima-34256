class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_buyer = PurchaseBuyer.new
  end

  def create
    @purchase_buyer = PurchaseBuyer.new(purchase_params)
    @item = Item.find(params[:item_id])
    binding.pry
    if @purchase_buyer.valid?
      @purchase_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:postal_code, :prefecture_id, :city, :address, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end