class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!
    redirect_to sauna_review_path(review_id: review.id, sauna_id: @sauna)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end