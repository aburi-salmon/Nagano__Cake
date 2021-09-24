class Admins::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @orders = Order.where(member_id: @order.member.id)
    @all_price = @order_details.sum(:price)
    @all_quantity = @order_details.sum(:quantity)
    @total = @all_price * @all_quantity
    @delivery_cost = 800
    @charge = @total + @delivery_cost
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
