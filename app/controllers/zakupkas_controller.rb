class ZakupkasController < ApplicationController
  before_action :set_zakupka, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @zakupkas = Zakupka.all
    respond_with(@zakupkas)
  end

  def show
    respond_with(@zakupka)
  end

  def new
    @zakupka = Zakupka.new
    respond_with(@zakupka)
  end

  def edit
  end

  def create
    @zakupka = Zakupka.new(zakupka_params)
    @zakupka.save
    respond_with(@zakupka)
  end

  def update
    @zakupka.update(zakupka_params)
    respond_with(@zakupka)
  end

  def destroy
    @zakupka.destroy
    respond_with(@zakupka)
  end

  private
    def set_zakupka
      @zakupka = Zakupka.find(params[:id])
    end

    def zakupka_params
      params.require(:zakupka).permit(:numbill, :manager_id, :doner_id, :zakupkastate_id, :addrate, :sum, :margin, :comment, :arhive)
    end
end
