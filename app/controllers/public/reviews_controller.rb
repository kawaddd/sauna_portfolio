class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, expect: :index
  def index
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review)
    else
      @reviews = Review.all
      render 'index'
    end
  end

  def edit
  end

  def update
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :sauna_id, :score, :headline, :text, :visit_day)
  end

end