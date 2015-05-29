class ReestrprihodovsController < ApplicationController
  before_action :set_reestrprihodov, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reestrprihodovs = Reestrprihodov.all
    respond_with(@reestrprihodovs)
  end

  def show
    respond_with(@reestrprihodov)
  end

  def new
    @reestrprihodov = Reestrprihodov.new
    respond_with(@reestrprihodov)
  end

  def edit
  end

  def create
    @reestrprihodov = Reestrprihodov.new(reestrprihodov_params)
    @reestrprihodov.save
    redirect_to :reestrprihodovs
    #respond_with(@reestrprihodov)
  end

  def update
    @reestrprihodov.update(reestrprihodov_params)
    redirect_to :reestrprihodovs
    #respond_with(@reestrprihodov)
  end

  def destroy
    @reestrprihodov.destroy
    respond_with(@reestrprihodov)
  end

  private
    def set_reestrprihodov
      @reestrprihodov = Reestrprihodov.find(params[:id])
    end

    def reestrprihodov_params
      params.require(:reestrprihodov).permit(:kontragent, :numbill, :numprihoddoc, :prihoddate, :sendwithpech, :givetoruk, :givetobuh)
    end
end
