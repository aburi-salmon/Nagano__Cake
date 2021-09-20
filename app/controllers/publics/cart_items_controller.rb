class Publics::CartItemsController < ApplicationController

  #before_action :authenticate_customer!

  def index
    @cart_items = current_member.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.member_id = current_member.id
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def destoy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:produ_id, :member_id)
  end

end

