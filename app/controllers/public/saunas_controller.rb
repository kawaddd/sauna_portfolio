class Public::SaunasController < ApplicationController
  def index
    @saunas = Sauna.all
    # @saunas = Sauna.page(params[:page])
  end

  def show
    @sauna = Sauna.find(params[:id])
  end
end
