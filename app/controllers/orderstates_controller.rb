class OrderstatesController < ApplicationController
  before_action :set_orderstate, only: [:show, :edit, :update, :destroy]

  # GET /orderstates
  # GET /orderstates.json
  def index
    @orderstates = Orderstate.all
  end

  # GET /orderstates/1
  # GET /orderstates/1.json
  def show
  end

  # GET /orderstates/new
  def new
    @orderstate = Orderstate.new
  end

  # GET /orderstates/1/edit
  def edit
  end

  # POST /orderstates
  # POST /orderstates.json
  def create
    @orderstate = Orderstate.new(orderstate_params)

    respond_to do |format|
      if @orderstate.save
        format.html { redirect_to @orderstate, notice: 'Orderstate was successfully created.' }
        format.json { render :show, status: :created, location: @orderstate }
      else
        format.html { render :new }
        format.json { render json: @orderstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderstates/1
  # PATCH/PUT /orderstates/1.json
  def update
    respond_to do |format|
      if @orderstate.update(orderstate_params)
        format.html { redirect_to @orderstate, notice: 'Orderstate was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderstate }
      else
        format.html { render :edit }
        format.json { render json: @orderstate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderstates/1
  # DELETE /orderstates/1.json
  def destroy
    @orderstate.destroy
    respond_to do |format|
      format.html { redirect_to orderstates_url, notice: 'Orderstate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderstate
      @orderstate = Orderstate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderstate_params
      params.require(:orderstate).permit(:state, :color)
    end
end
