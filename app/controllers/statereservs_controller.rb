class StatereservsController < ApplicationController
  before_action :set_statereserv, only: [:show, :edit, :update, :destroy]

  # GET /statereservs
  # GET /statereservs.json
  def index
    @statereservs = Statereserv.all
  end

  # GET /statereservs/1
  # GET /statereservs/1.json
  def show
  end

  # GET /statereservs/new
  def new
    @statereserv = Statereserv.new
  end

  # GET /statereservs/1/edit
  def edit
  end

  # POST /statereservs
  # POST /statereservs.json
  def create
    @statereserv = Statereserv.new(statereserv_params)

    respond_to do |format|
      if @statereserv.save
        format.html { redirect_to @statereserv, notice: 'Statereserv was successfully created.' }
        format.json { render :show, status: :created, location: @statereserv }
      else
        format.html { render :new }
        format.json { render json: @statereserv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statereservs/1
  # PATCH/PUT /statereservs/1.json
  def update
    respond_to do |format|
      if @statereserv.update(statereserv_params)
        format.html { redirect_to @statereserv, notice: 'Statereserv was successfully updated.' }
        format.json { render :show, status: :ok, location: @statereserv }
      else
        format.html { render :edit }
        format.json { render json: @statereserv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statereservs/1
  # DELETE /statereservs/1.json
  def destroy
    @statereserv.destroy
    respond_to do |format|
      format.html { redirect_to statereservs_url, notice: 'Statereserv was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statereserv
      @statereserv = Statereserv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statereserv_params
      params.require(:statereserv).permit(:status, :color)
    end
end
