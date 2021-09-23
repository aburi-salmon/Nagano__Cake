class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  # has_many :member_choice_products, through: :genres, source: :member
  attachment :image
  validates :ex_unit_price, presence: true
  # 商品の金額が空だとpublic側で使うadd_tax_priceの表示でエラーが発生するためバリデーションを追記


  def add_tax_price
    (self.ex_unit_price * 1.08).round
  end

  def taxin_price
      ex_unit_price*1.1
  end

  def self.search(keyword)
  where(["name like?", "%#{keyword}%"])
  end
  
end
