class Order < ApplicationRecord
  belongs_to :item
  belongs_to :address
  belongs_to :user
end
