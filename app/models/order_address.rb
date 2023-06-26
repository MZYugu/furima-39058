class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :cities, :address, :building, :tel_number, :order_id
  
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :cities
    validates :address
    validates :tel_number, format: {with: /\A0[0-9]{9,10}\z/, message: "is invalid. Exclude hyphen(-)"}
    validates :order_id
  end

  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
end