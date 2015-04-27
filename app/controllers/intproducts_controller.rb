class IntproductsController < ApplicationController
  before_action :set_intproduct, only: [:show, :edit, :update, :destroy]

  # GET /intproducts
  # GET /intproducts.json
  def index
    @intproducts = Intproduct.all
  end

  # GET /intproducts/1
  # GET /intproducts/1.json
  def show
  end

  # GET /intproducts/new
  def new
    @intproduct = Intproduct.new
  end

  # GET /intproducts/1/edit
  def edit
  end

  # POST /intproducts
  # POST /intproducts.json
  def create
    @intproduct = Intproduct.new(intproduct_params)

    respond_to do |format|
      if @intproduct.save
        format.html { redirect_to :intproducts, notice: 'Intproduct was successfully created.' }
        format.json { render :index, status: :created, location: @intproduct }
      else
        format.html { render :new }
        format.json { render json: @intproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intproducts/1
  # PATCH/PUT /intproducts/1.json
  def update
    respond_to do |format|
      if @intproduct.update(intproduct_params)
        format.html { redirect_to :intproducts, notice: 'Intproduct was successfully updated.' }
        format.json { render :index, status: :ok, location: @intproduct }
      else
        format.html { render :edit }
        format.json { render json: @intproduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intproducts/1
  # DELETE /intproducts/1.json
  def destroy
    @intproduct.destroy
    respond_to do |format|
      format.html { redirect_to intproducts_url, notice: 'Intproduct was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intproduct
      @intproduct = Intproduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def intproduct_params
      params.require(:intproduct).permit(:name, :partnumber, :serialnumber, :prodtype_id, :employee_id)
    end
end
