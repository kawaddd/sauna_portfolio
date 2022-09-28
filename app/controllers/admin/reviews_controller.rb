class Admin::ReviewsController < ApplicationController
  def show
    @reviews = Review.where(sauna_id: params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy!
    redirect_to admin_reviews_path
  end
end
