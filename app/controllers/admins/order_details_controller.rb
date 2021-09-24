class Admins::OrderDetailsController < ApplicationController

  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admins_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
