class CartItem < ApplicationRecord

  belongs_to :member
  belongs_to :product

  def sum_of_price
    product.taxin_price * quantity
  end

end
