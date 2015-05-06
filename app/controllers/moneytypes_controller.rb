class MoneytypesController < ApplicationController
  before_action :set_moneytype, only: [:show, :edit, :update, :destroy]

  # GET /moneytypes
  # GET /moneytypes.json
  def index
    @moneytypes = Moneytype.all
  end

  # GET /moneytypes/1
  # GET /moneytypes/1.json
  def show
  end

  # GET /moneytypes/new
  def new
    @moneytype = Moneytype.new
  end

  # GET /moneytypes/1/edit
  def edit
  end

  # POST /moneytypes
  # POST /moneytypes.json
  def create
    @moneytype = Moneytype.new(moneytype_params)

    respond_to do |format|
      if @moneytype.save
        format.html { redirect_to :moneytypes, notice: 'Moneytype was successfully created.' }
        #format.json { render :show, status: :created, location: @moneytype }
      else
        format.html { render :new }
        #format.json { render json: @moneytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moneytypes/1
  # PATCH/PUT /moneytypes/1.json
  def update
    respond_to do |format|
      if @moneytype.update(moneytype_params)
        format.html { redirect_to :moneytypes, notice: 'Moneytype was successfully updated.' }
        #format.json { render :show, status: :ok, location: @moneytype }
      else
        format.html { render :edit }
        #format.json { render json: @moneytype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moneytypes/1
  # DELETE /moneytypes/1.json
  def destroy
    @moneytype.destroy
    respond_to do |format|
      format.html { redirect_to moneytypes_url, notice: 'Moneytype was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moneytype
      @moneytype = Moneytype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moneytype_params
      params.require(:moneytype).permit(:name, :znak, :curse)
    end
end
