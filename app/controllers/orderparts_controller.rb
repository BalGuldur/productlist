class OrderpartsController < ApplicationController
  before_action :set_orderpart, only: [:show, :edit, :update, :destroy]

  # GET /orderparts
  # GET /orderparts.json
  def index
    @orderparts = Orderpart.all
  end

  # GET /orderparts/1
  # GET /orderparts/1.json
  def show
  end

  # GET /orderparts/new
  def new
    @orderpart = Orderpart.new
  end

  # GET /orderparts/1/edit
  def edit
  end

  # POST /orderparts
  # POST /orderparts.json
  def create
    @orderpart = Orderpart.new(orderpart_params)

    respond_to do |format|
      if @orderpart.save
        format.html { redirect_to @orderpart, notice: 'Orderpart was successfully created.' }
        format.json { render :show, status: :created, location: @orderpart }
      else
        format.html { render :new }
        format.json { render json: @orderpart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderparts/1
  # PATCH/PUT /orderparts/1.json
  def update
    respond_to do |format|
      if @orderpart.update(orderpart_params)
        format.html { redirect_to @orderpart, notice: 'Orderpart was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderpart }
      else
        format.html { render :edit }
        format.json { render json: @orderpart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderparts/1
  # DELETE /orderparts/1.json
  def destroy
    @orderpart.destroy
    respond_to do |format|
      format.html { redirect_to orderparts_url, notice: 'Orderpart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderpart
      @orderpart = Orderpart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderpart_params
      params.require(:orderpart).permit(:partnumber, :partdescr, :qty, :pricesell, :priceship, :shipper, :beznal, :convert, :predatetime, :faktdatetime, :statereserv_id, :nds)
    end
end
