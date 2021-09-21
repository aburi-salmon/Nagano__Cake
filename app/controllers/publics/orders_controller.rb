class Publics::OrdersController < ApplicationController

  def new
    @order = Order.new
    @member = current_member
  end

  def confirm
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @member = current_member
    @order.save
    redirect_to :orders_confirm_path
  end

  def create
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name)
  end

end
