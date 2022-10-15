class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, expect: :index
  def index
    @sauna = Sauna.find(params[:sauna_id])
    @reviews = @sauna.reviews.page(params[:page]).per(5)
    @count = @sauna.reviews.count
  end

  def show
    @sauna = Sauna.find(params[:sauna_id])
    @review = Review.find(params[:id])
    @comments = @review.comments.page(params[:page]).per(20)
    @comment = Comment.new
    @count = @review.comments.count
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
    # sauna_id = params[:sauna_id]
    # review_id = params[:id]
    @review = Review.find(params[:id])
    @sauna = Sauna.find(params[:sauna_id])
  end

  def update
    review = Review.find(params[:id])
    review.update!(review_params)
    redirect_to sauna_path(review.sauna.id)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy!
    redirect_to user_reviewed_saunas_path(current_user.id)
  end

  private
  def review_params
    params.require(:review).permit(:user_id, :sauna_id, :score, :headline, :text, :visit_day)
  end

end