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

  def edit
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
  end

  def otkaz
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    @orderpart.state = Orderstate.find_by(state: "Отказ в резерве")
    @orderpart.save
    redirect_to edit_order_path(@order)
  end

  def update
    @order = Order.find(params[:order_id])
    @orderpart = Orderpart.find(params[:id])
    if @orderpart.update(orderpart_params)
      checkstate
      redirect_to edit_order_path(@order)
    else
      render :edit_order_orderpart_path
    end
  end

  private

  def checkstate
    if @orderpart.state!=Orderstate.find_by(state: "Отказ в резерве")
      if @orderpart.doner_id!=nil && @orderpart.panswtime_id!=nil
        if @orderpart.distrib!=nil && @orderpart.reztime_id!=nil && @orderpart.beznal!=nil && @orderpart.nds!=nil && @orderpart.rezprice!=nil && @orderpart.rezpricetype_id!=nil && @orderpart.shipprice!=nil && @orderpart.pshiptime_id!=nil && @orderpart.convertion!=nil
          @orderpart.state=Orderstate.find_by(state: "Зарезервировано")
        elsif
          @orderpart.state=Orderstate.find_by(state: "Принято в ОЗ")
        end
      end
      @orderpart.save
    end
  end

  def orderpart_params
    params.require(:orderpart).permit(:partnum, :descr, :qty, :psaleprice, :distrib, :comment, :doner_id, :panswtime_id, :distrib, :reztime_id, :beznal, :nds, :rezprice, :rezpricetype_id, :shipprice, :pshiptime_id, :convertion)
  end
end
