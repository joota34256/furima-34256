class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_set, only: [:show, :edit, :update]
  before_action :redirect_root, only: [:edit, :update]

  def index
    @items = Item.all
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_set
    @item = Item.find(params[:id])
  end

  def redirect_root
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def item_params
    params.require(:item).permit(:name, :description, :shipping_charge_id, :prefecture_id, :shipping_date_id, :price, :category_id,
                                 :state_id, :image).merge(user_id: current_user.id)
  end
end
