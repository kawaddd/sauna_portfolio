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
    @reviews = @user.reviews
  end

  def hozon_saunas
    @user = User.find(params[:user_id])
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def visited_saunas
    @user = User.find(params[:user_id])
    @visits = Visit.where(user_id: current_user.id)
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
