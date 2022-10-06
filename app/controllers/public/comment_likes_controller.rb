class Public::CommentLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment_comment_like = CommentLike.new(user_id: current_user.id, comment_id: params[:comment_id])
    @comment_comment_like.save
    redirect_to sauna_review_path(sauna_id: params[:sauna_id], id: params[:review_id])
  end



  def destroy
    @comment_comment_like = CommentLike.find_by(user_id: current_user.id, comment_id: params[:comment_id])
    @comment_comment_like.destroy
    redirect_to sauna_review_path(sauna_id: params[:sauna_id], id: params[:review_id])
  end
end
