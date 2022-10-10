class Public::SaunasController < ApplicationController
  def index
    saunas = Sauna.where(user_id: params[:user_id])
    @saunas = saunas.page(params[:page]).per(3)
    @review = Review.new
    @count = saunas.count
    # @review_count = saunas.reviews.count
  end

  def show
    @sauna = Sauna.find(params[:id])
    @review = Review.new
  end
end