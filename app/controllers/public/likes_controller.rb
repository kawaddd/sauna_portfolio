class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review_like = Like.new(user_id: current_user.id, review_id: params[:review_id])
    @review_like.save
    redirect_to review_path(params[:review_id])
  end



  def destroy
    @review_likee = Like.find_by(user_id: current_user.id, review_id: params[:review_id])
    @review_like.destroy
    redirect_to review_path(params[:review_id])
  end
end