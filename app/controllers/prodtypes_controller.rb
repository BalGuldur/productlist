class ProdtypesController < ApplicationController
  before_action :set_prodtype, only: [:show, :edit, :update, :destroy]

  # GET /prodtypes
  # GET /prodtypes.json
  def index
    @prodtypes = Prodtype.all
  end

  # GET /prodtypes/1
  # GET /prodtypes/1.json
  def show
  end

  # GET /prodtypes/new
  def new
    @prodtype = Prodtype.new
  end

  # GET /prodtypes/1/edit
  def edit
  end

  # POST /prodtypes
  # POST /prodtypes.json
  def create
    @prodtype = Prodtype.new(prodtype_params)

    respond_to do |format|
      if @prodtype.save
        format.html { redirect_to :prodtypes, notice: 'Prodtype was successfully created.' }
        format.json { render :index, status: :created, location: @prodtype }
      else
        format.html { render :new }
        format.json { render json: @prodtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prodtypes/1
  # PATCH/PUT /prodtypes/1.json
  def update
    respond_to do |format|
      if @prodtype.update(prodtype_params)
        format.html { redirect_to :prodtypes, notice: 'Prodtype was successfully updated.' }
        format.json { render :index, status: :ok, location: @prodtype }
      else
        format.html { render :edit }
        format.json { render json: @prodtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prodtypes/1
  # DELETE /prodtypes/1.json
  def destroy
    @prodtype.destroy
    respond_to do |format|
      format.html { redirect_to prodtypes_url, notice: 'Prodtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prodtype
      @prodtype = Prodtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prodtype_params
      params.require(:prodtype).permit(:name)
    end
end
