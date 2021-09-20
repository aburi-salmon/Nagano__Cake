class Product < ApplicationRecord
  has_many :genres
  has_many :cart_items
  # has_many :member_choice_products, through: :genres, source: :member
  attachment :image

  def add_tax_price
    (self.ex_unit_price * 1.08).round
  end
end
