class ItemsController < ApplicationController
  def index
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
    params.require(:item).permit(:item_name, :price, :text, :category_id, :item_status_id, :postage_bare_id, :prefecture_id, :days_ship_id).merge(user_id: current_user.id)
  end
end
