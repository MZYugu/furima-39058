class Item < 
  with_options presence: true do
    validates :item_name
    validates :price
    validates :text
    validates :category_id
    validates :item_status_id
    validates :postage_bare_id
    validates :prefecture_id
    validates :days_ship_id
  end

  belongs_to :user
end
