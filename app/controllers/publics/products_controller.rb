class Publics::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @genre = Genre.find(@product.genre_id)
    @genres = Genre.all
  end
end
