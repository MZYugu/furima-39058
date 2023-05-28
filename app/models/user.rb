class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :lastname_kanji
    validates :firstname_kanji
    validates :lastname_katakana
    validates :firstname_katakana
    validates :birthday
  end

end
