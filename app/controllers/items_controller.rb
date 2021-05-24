class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def index
    # @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:description,:shipping_charge_id,:prefecture_id,:shipping_date_id,:price,:category_id,:state_id,:image).merge(user_id:current_user.id)
  end
end