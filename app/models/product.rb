class Product < ApplicationRecord
  has_many :genres
  # has_many :member_choice_products, through: :genres, source: :member
  attachment :image
  validates :ex_unit_price, presence: true
  # 商品の金額が空だとpublic側で使うadd_tax_priceの表示でエラーが発生するためバリデーションを追記


  def add_tax_price
    (self.ex_unit_price * 1.08).round
  end
end
