class DistributorsController < ApplicationController
  before_action :set_distributor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @distributors = Distributor.order(:name)
    respond_with(@distributors)
  end

  def show
    respond_with(@distributor)
  end

  def new
    @distributor = Distributor.new
    respond_with(@distributor)
  end

  def edit
  end

  def create
    @distributor = Distributor.new(distributor_params)
    @distributor.save
    respond_with(@distributor)
  end

  def update
    @distributor.update(distributor_params)
    respond_with(@distributor)
  end

  def destroy
    @distributor.destroy
    respond_with(@distributor)
  end

  private
    def set_distributor
      @distributor = Distributor.find(params[:id])
    end

    def distributor_params
      params.require(:distributor).permit(:name)
    end
end
