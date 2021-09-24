class Admins::HomesController < ApplicationController

  def top
    @orders = Order.all
    #@quantity = CartItem.where(params[:member_id]).sum(:quantity)
  end

end
