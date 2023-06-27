class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than:10000000}
    validates :text
    with_options numericality: { other_than: 1, message: "can't be blank."} do
      validates :category_id
      validates :item_status_id
      validates :postage_bare_id
      validates :prefecture_id
      validates :days_ship_id
    end
  end

  belongs_to :user
  has_one_attached :image
  belongs_to :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :postage_bare
  belongs_to :prefecture
  belongs_to :days_ship
end
