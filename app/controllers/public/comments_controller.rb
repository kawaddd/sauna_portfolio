class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = params[:review_id]
    if @comment.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    # review = params[:review_id]
    # sauna = params[:sauna_id]
    comment = Comment.find(params[:id])
    comment.destroy!
    # redirect_to sauna_review_path(id: review, sauna_id: sauna)
    redirect_to sauna_review_path(id: params[:review_id], sauna_id: params[:sauna_id])
  end

  private
  def comment_params
    params.permit(:comment)
  end
end