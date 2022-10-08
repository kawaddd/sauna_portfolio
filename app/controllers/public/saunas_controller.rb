class Public::SaunasController < ApplicationController
  def index
    @saunas = Sauna.where(user_id: params[:user_id]).page(params[:page]).per(3)
    @review = Review.new
  end

  def show
    @sauna = Sauna.find(params[:id])
    @review = Review.new
  end
end