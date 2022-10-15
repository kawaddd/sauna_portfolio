class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 取得したユーザーに結びついている全ての投稿を取得し、@user_postsに代入する。
    @user_reviews = @user.reviews
    @user_comments = @user.comments
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  def reviewed_saunas
    @user = User.find(params[:user_id])
    @reviews = @user.reviews.page(params[:page]).per(10)
    @count = @user.reviews.count
  end

  def hozon_saunas
    @user = User.find(params[:user_id])
    @bookmarks = @user.bookmarks.page(params[:page]).per(10)
    # @bookmarks = Bookmark.where(user_id: current_user.id).page(params[:page]).per(10)
    @count = @user.bookmarks.count
  end

  def visited_saunas
    @user = User.find(params[:user_id])
    @visits = @user.visits.page(params[:page]).per(10)
    # @visits = Visit.where(user_id: current_user.id).page(params[:page]).per(10)
    @count = @user.visits.count
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname,:gender,:birth_date,:profile_image,:self_introduction,:is_active)
  end
end
