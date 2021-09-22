class Publics::CartItemsController < ApplicationController

  before_action :authenticate_member!

  def index
    @cart_items = current_member.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.member_id = current_member.id
    @cart_items = current_member.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.product_id == @cart_item.product_id
         new_quantity = cart_item.quantity + @cart_item.quantity
         cart_item.update_attribute(:quantity, new_quantity)
         @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    member = Member.find(current_member.id)
    member.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :member_id, :quantity)
  end

end