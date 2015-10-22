class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    current_user!=nil ? usr=current_user.employee : ""
    if usr==nil
      @orders = Order.where(id: "1")
    elsif usr.department.viewallord
      @orders = Order.where.not(arhive: true) + Order.where(arhive: nil)
    else
      @orders = Order.where(manager_id: usr.id)
      @orders = @orders.where.not(arhive: true) + @orders.where(arhive: nil)
    end
#    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  def arhives
    @orders=Order.where(arhive: true)
  end

  def arhive
    @order=Order.find(params[:id])
    @order.arhive=true
    @order.save
    redirect_to orders_url
  end

  def desarhive
    @order=Order.find(params[:id])
    @order.arhive=nil
    @order.save
    redirect_to arhives_orders_url
  end

  def uploadfromexcel
    @order=Order.find(params[:id])
    upllink = params[:uplfile]
    @file = upllink.tempfile
    @file.each do |line|
      line.encode!('UTF-8', invalid: :replace, undef: :replace, replace: '')
      line.chomp!
      linehash = line.split(';')
      if linehash[0]!=nil && linehash[0]!=""
        @orderpart = Orderpart.new
        @orderpart.state = Orderstate.find_by(state: "Передано в ОЗ")
        @orderpart.partnum = linehash[0]
        @orderpart.descr = linehash[1]
        @orderpart.qty = linehash[2]
        @orderpart.psaleprice = linehash[3]
        @orderpart.distributor = Distributor.find_by(name: linehash[4])
        @orderpart.order = @order
        @orderpart.save
        @orderpart.checkstate
      end
      @order.save
      @order.checkstate
    end
    redirect_to edit_order_path(@order)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @orderparts = @order.orderparts
    @order.checkstate
    respond_to do |format|
      format.html
      format.csv { send_data @orderparts.to_csv(col_sep: ";"), :filename => 'order' + @order.id.to_s + '.csv'}
      #Генерируем в csv список деталей заказа
    end

  end

  def export
    @order=Order.find(params[:id])
  end

  def priemall
    @order=Order.find(params[:id])
    @orderparts=@order.orderparts
    @orderparts.each do |orderpart|
      orderpart.doner = current_user.employee
      orderpart.panswtime_id = params[:panswtimeid]
      orderpart.save
      orderpart.checkstate
      orderpart.save
    end
    redirect_to edit_order_path(@order)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.manager = current_user.employee

    respond_to do |format|
      if @order.save
        format.html { redirect_to edit_order_path(@order), notice: 'Order was successfully created.' }
        #format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        #format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to edit_order_path(@order), notice: 'Order was successfully updated.' }
        #format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        #format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:arhive, :numbill, :manager_id, :doner_id, :orderstate_id, :addrate, :sum, :pmargin, :comment)
    end
end
