class Admins::ProductsController < ApplicationController
  before_action :set_genres, only:[:index, :new, :show, :edit, :create, :update]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_products_path
  end

  def show
    @product = Product.find(params[:id])
    @genre = Genre.find(@product.genre_id)
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def set_genres
    @genres = Genre.all
  end

  private
  def product_params
    params.require(:product).permit(:genre_id, :name, :ex_unit_price,
    :description, :image, :is_active)
  end
end