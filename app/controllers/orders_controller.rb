class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid? 
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:post_code, :prefecture_id, :cities, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end

end
