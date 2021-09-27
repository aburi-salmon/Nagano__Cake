class SearchesController < ApplicationController
  def search
    @product_search = Product.search(params[:keyword])
    @keyword = params[:keyword]
    @products = Product.page(params[:page]).order(created_at: :desc).per(8)
    @genres = Genre.all
  end
end
