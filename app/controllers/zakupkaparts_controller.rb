class ZakupkapartsController < ApplicationController
  before_action :set_zakupkapart, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @zakupkaparts = Zakupkapart.all
    respond_with(@zakupkaparts)
  end

  def show
    respond_with(@zakupkapart)
  end

  def new
    @zakupkapart = Zakupkapart.new
    respond_with(@zakupkapart)
  end

  def edit
  end

  def create
    @zakupkapart = Zakupkapart.new(zakupkapart_params)
    @zakupkapart.save
    respond_with(@zakupkapart)
  end

  def update
    @zakupkapart.update(zakupkapart_params)
    respond_with(@zakupkapart)
  end

  def destroy
    @zakupkapart.destroy
    respond_with(@zakupkapart)
  end

  private
    def set_zakupkapart
      @zakupkapart = Zakupkapart.find(params[:id])
    end

    def zakupkapart_params
      params.require(:zakupkapart).permit(:partnum, :descr, :qty, :psaleprice, :doner_id, :state_id, :rezprice, :rezpricetype_id, :nds, :beznal, :pshiptime_id, :shipprice, :convertion, :pmargin, :comment, :order_id, :distributor_id, :idorddistrib)
    end
end
