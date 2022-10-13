class Public::SaunasController < ApplicationController
  def index
    saunas = Sauna.where(user_id: params[:user_id])
    @saunas = saunas.page(params[:page]).per(4)
    @review = Review.new
    @count = saunas.count
    # @review_count = saunas.reviews.count
  end

  def show
    @sauna = Sauna.find(params[:id])
    @review = Review.new
    # byebug
  end

  def tag
    #byebug
    @sauna_all = Sauna.all
    @sauna_ids = []
    flag = params[:flag]
    case flag
    when "1"
      min = 0
      max = 2
    when "2"
      min = 2
      max = 3
    when "3"
      min = 3
      max = 4
    when "4"
      min = 4
      max = 5
    end
    @sauna_all.each do |sauna|
      review_scores = sauna.reviews.pluck(:score)
      review_count = review_scores.count
      average = review_scores.sum.fdiv(review_count)
      if min < average && average <= max
        @sauna_ids << sauna.id
      end
    end
    @saunas = Sauna.where(id: @sauna_ids).page(params[:page]).per(3)

    @review = Review.new
    @count = @saunas.count
    #yebug
    render 'index'
  end
end