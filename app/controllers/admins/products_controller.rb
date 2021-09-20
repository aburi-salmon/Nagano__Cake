class Admins::ProductsController < ApplicationController
  before_action :set_genres, only:[:index, :new, :show, :edit, :create, :update]
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
   # @genre = Genre.find(@product.genre_id)
    #@cart_item = CartItem.new
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_product_path(@product)
    else
      render :edit
    end
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
