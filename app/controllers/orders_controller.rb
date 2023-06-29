class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_order = OrderAddress.new(order_params)
    Address.create(address_params)
    if @order_address.valid? 
      @order.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def order_params
    item = Item.find(params[:id])
    params.reqire(:item_address).merge(item_id: current_user.id, item_id: item.id)
  end

end
