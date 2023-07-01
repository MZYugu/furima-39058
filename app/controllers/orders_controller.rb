class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    Address.create(address_params)
    if @order_address.valid? 
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    item = Item.find(params[:id])
    params.reqire(:order_address).permit(:post_code, :prefecture_id, :cities, :address,: building, :tel_number).merge(user_id: current_user.id, item_id: item.id)
  end

end
