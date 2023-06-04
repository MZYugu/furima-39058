class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :price
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
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :postage_bare
  belongs_to :prefecture
  belongs_to :days_ship
end