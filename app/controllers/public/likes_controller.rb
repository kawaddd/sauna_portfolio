class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review_like = Like.new(user_id: current_user.id, review_id: params[:review_id])
    @review_like.save
    redirect_to sauna_reviews_path(sauna_id: params[:sauna_id])
  end



  def destroy
    @review_like = Like.find_by(user_id: current_user.id, review_id: params[:review_id])
    @review_like.destroy
    redirect_to sauna_reviews_path(sauna_id: params[:sauna_id])
  end
end