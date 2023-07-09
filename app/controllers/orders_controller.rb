class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.includes(:user).find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
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
  def order_params
    item = Item.find(params[:item_id])
    params.require(:order_address).permit(:post_code, :prefecture_id, :cities, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
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
