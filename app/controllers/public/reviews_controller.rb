class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, expect: :index
  def index
    @sauna = Sauna.find(params[:sauna_id])
    @reviews = @sauna.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_back(fallback_location: root_path)
    else
      @reviews = Review.all
      render 'index'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @sauna = Sauna.find(params[:sauna_id])
    # binding.pry
  end

  def update
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to sauna_reviewes_path
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to sauna_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :sauna_id, :score, :headline, :text, :visit_day)
  end

end