class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item

  def index
    if current_user.id == @item.user_id || @item.order
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid? 
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def get_item
    @item = Item.includes([:user, :order]).find(params[:item_id])
  end
  
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :cities, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
end

end
