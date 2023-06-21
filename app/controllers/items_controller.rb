class ItemsController < ApplicationController
  before_action :get_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]

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
  end
  
  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
    end
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :text, :category_id, :item_status_id, :postage_bare_id, :prefecture_id, :days_ship_id, :image).merge(user_id: current_user.id)
  end

  def get_item
    @item = Item.includes(:user).find(params[:id])
  end
end
