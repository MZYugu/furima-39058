class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    Address.create(address_params)
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def order_params
    item = Item.find(params[:id])
    params.merge(item_id: current_user.id, item_id: item.id)
  end

  def address_params
    params.permit(:post_code, :prefecture_id, :cities, :address, :building, :tel_number).merge(order_id: @order.id)
  end
end
