class OrderpartsController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @orderpart = @order.orderparts.create(orderpart_params)
    @orderpart.state = Orderstate.find_by(state: "Передано в ОЗ")
    @orderpart.save
    redirect_to edit_order_path(@order)
  end

  def show
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
  end

  def update
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    if @orderpart.update(orderpart_params)
      redirect_to edit_order_path(@order)
    else
      render :edit_order_orderpart_path
    end
  end

  private
  def orderpart_params
    params.require(:orderpart).permit(:partnum, :descr, :qty, :psaleprice, :distrib, :comment)
  end
end
