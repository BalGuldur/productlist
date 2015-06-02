class ReestrotgruzoksController < ApplicationController
  before_action :set_reestrotgruzok, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reestrotgruzoks = Reestrotgruzok.all
    respond_with(@reestrotgruzoks)
  end

  def show
    respond_with(@reestrotgruzok)
  end

  def new
    @reestrotgruzok = Reestrotgruzok.new
    respond_with(@reestrotgruzok)
  end

  def edit
  end

  def create
    @reestrotgruzok = Reestrotgruzok.new(reestrotgruzok_params)
    @reestrotgruzok.save
    redirect_to :reestrotgruzoks
    #respond_with(@reestrotgruzok)
  end

  def update
    @reestrotgruzok.update(reestrotgruzok_params)
    redirect_to :reestrotgruzoks
    #respond_with(@reestrotgruzok)
  end

  def destroy
    @reestrotgruzok.destroy
    respond_with(@reestrotgruzok)
  end

  private
    def set_reestrotgruzok
      @reestrotgruzok = Reestrotgruzok.find(params[:id])
    end

    def reestrotgruzok_params
      params.require(:reestrotgruzok).permit(:kontragent, :numbill, :numotgruzdoc, :sendtoclient, :resievedate, :sendtobuh, :numsfaktur)
    end
end
