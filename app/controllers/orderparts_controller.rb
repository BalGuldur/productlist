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
    @orderpart.checkstate
  end

  def edit
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    @orderpart.checkstate
  end

  def otkaz
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    @orderpart.state = Orderstate.find_by(state: "Отказ в резерве")
    @orderpart.save
    @order.checkstate
    redirect_to edit_order_path(@order)
  end

  def inwork
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    @orderpart.state = Orderstate.find_by(state: "Передано в ОЗ")
    @orderpart.checkstate
    @orderpart.save
    @order.checkstate
    @order.save
    redirect_to edit_order_path(@order)
  end

  def otkazm
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    @orderpart.state = Orderstate.find_by(state: "Удалено менеджером")
    @orderpart.save
    @order.checkstate
    redirect_to edit_order_path(@order)
  end

  def update
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    if @orderpart.update(orderpart_params) && @orderpart.state==Orderstate.find_by(state: "Удалено менеджером")
      @orderpart.checkstate
      @order.checkstate
      redirect_to edit_order_path(@order)
    else
      redirect_to edit_order_path(@order)
    end
  end

  def destroy
    @orderpart=Orderpart.find(params[:id])
    @orderpart.delete
    redirect_to :back
  end

  private

  def orderpart_params
    params.require(:orderpart).permit(:idorddistrib, :partnum, :descr, :qty, :psaleprice, :distributor_id, :comment, :doner_id, :panswtime_id, :distrib, :reztime, :beznal, :nds, :rezprice, :rezpricetype_id, :shipprice, :pshiptime_id, :convertion)
  end
end
