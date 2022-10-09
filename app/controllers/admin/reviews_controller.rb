class Admin::ReviewsController < ApplicationController
  def index
    @count = Review.all.count
    @reviews = Review.page(params[:page]).per(9)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy!
    redirect_to admin_reviews_path
  end
end
