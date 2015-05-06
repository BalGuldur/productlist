class OurtimesController < ApplicationController
  before_action :set_ourtime, only: [:show, :edit, :update, :destroy]

  # GET /ourtimes
  # GET /ourtimes.json
  def index
    @ourtimes = Ourtime.all
  end

  # GET /ourtimes/1
  # GET /ourtimes/1.json
  def show
  end

  # GET /ourtimes/new
  def new
    @ourtime = Ourtime.new
  end

  # GET /ourtimes/1/edit
  def edit
  end

  # POST /ourtimes
  # POST /ourtimes.json
  def create
    @ourtime = Ourtime.new(ourtime_params)

    respond_to do |format|
      if @ourtime.save
        format.html { redirect_to :ourtimes, notice: 'Ourtime was successfully created.' }
        #format.json { render :show, status: :created, location: @ourtime }
      else
        format.html { render :new }
        #format.json { render json: @ourtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ourtimes/1
  # PATCH/PUT /ourtimes/1.json
  def update
    respond_to do |format|
      if @ourtime.update(ourtime_params)
        format.html { redirect_to :ourtimes, notice: 'Ourtime was successfully updated.' }
        #format.json { render :show, status: :ok, location: @ourtime }
      else
        format.html { render :edit }
        #format.json { render json: @ourtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ourtimes/1
  # DELETE /ourtimes/1.json
  def destroy
    @ourtime.destroy
    respond_to do |format|
      format.html { redirect_to ourtimes_url, notice: 'Ourtime was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ourtime
      @ourtime = Ourtime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ourtime_params
      params.require(:ourtime).permit(:name, :rez, :answ, :ship)
    end
end
