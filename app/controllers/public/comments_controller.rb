class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to sauna_review_path(sauna_id: params[:sauna_id], id: params[:review_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = params[:review_id]
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      @sauna = Sauna.find(params[:sauna_id])
      @review = Review.find(params[:review_id])
      @comments = @review.comments.page(params[:page]).per(20)
      @count = @review.comments.count
      render 'public/reviews/show'
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