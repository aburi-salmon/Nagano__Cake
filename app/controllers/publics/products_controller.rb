class Publics::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).order(created_at: :desc).per(8)
    @product_all = Product.all
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    @genre = Genre.find(@product.genre_id)
    @genres = Genre.all
  end
end
