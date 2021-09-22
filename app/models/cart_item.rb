class CartItem < ApplicationRecord

  belongs_to :member
  belongs_to :product

  def sum_of_price
    product.taxin_price * quantity
  end

  with_options presence: true do
    validates :member_id
    validates :product_id
    validates :quantity
  end 
end
