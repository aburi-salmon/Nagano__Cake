class Publics::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    #@genre = Genre.find(@product.genre_id)
    #@genres = Genre.all
  end
end
