class OrderpartsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @orderpart = @order.orderparts.create(orderpart_params)
    redirect_to edit_order_path(@order)
  end

  private
  def orderpart_params
    params.require(:orderpart).permit(:partnum, :descr, :qty, :psaleprice, :distrib, :comment)
  end
end
