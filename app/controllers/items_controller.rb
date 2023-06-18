class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.all.order("created_at DESC")
    @count = Item.count
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
    @item = Item.includes(:user).find(params[:id])
  end
  
  private
  def item_params
    params.require(:item).permit(:item_name, :price, :text, :category_id, :item_status_id, :postage_bare_id, :prefecture_id, :days_ship_id, :image).merge(user_id: current_user.id)
  end
end
