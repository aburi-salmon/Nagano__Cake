class Publics::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @products = Product.all.order(created_at: :desc).limit(4)
  end

  def about
  end

end