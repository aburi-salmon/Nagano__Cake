class Publics::OrdersController < ApplicationController

  def new
    @order = Order.new
    @member = current_member
    @addresses = Address.where(member_id: current_member.id)
  end

  def confirm
    @order = Order.new(order_params)
    @member = current_member
    if params[:order][:order_address] == "0"
      @order.postal_code = @member.postal_code
      @order.address = @member.address
      @order.name = @member.last_name + @member.first_name
    elsif params[:order][:order_address] == "1"
      @sta = params[:order][:address_id].to_i
      @address = Address.find(@sta)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:order_address] == "2"
      @order.postal_code = @order.postal_code
      @order.address = @order.address
      @order.name = @order.name
    end
    @cart_items = current_member.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    @delivery_cost = 800
    @charge = @total + @delivery_cost
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_member.cart_items.each do |cart_item|
      @order_detail = @order.order_details.build
      @order_detail.order_id = @order.id
      @order_detail.product_id = cart_item.product_id
      @order_detail.quantity = cart_item.quantity
      @order_detail.price = cart_item.product.add_tax_price
      @order_detail.save
    end
    current_member.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
    @orders = Order.where(member_id: current_member.id)
    @orders.each do |order|
      @order_details = order.order_details
      @order_details.each do |order_detail|
        @total = order_detail.price * order_detail.quantity
        # @all_price = order_details.sum(:price)
        # @all_quantity = order_details.sum(:quantity)
        # @total = @all_price * @all_quantity
      end
    end
    @delivery_cost = 800
    @charge = @total + @delivery_cost
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @delivery_cost = 800
  end

  private

  def order_params
    params.require(:order).permit(:member_id, :charge, :status, :delivery_cost, :payment_method, :postal_code, :address, :name)
  end

end
