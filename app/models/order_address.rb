class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :cities, :address, :building, :tel_number, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :address
    validates :tel_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Exclude hyphen(-)"}
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, cities: cities, address: address, building: building, tel_number: tel_number, order_id: order.id)
  end
end