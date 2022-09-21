class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to user_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    current_user.update(is_active: false)
    reset_session
    redirect_to root_path
  ends

  private
  def user_params
    params.require(:user).permit(:nickname,:gender,:birth_date,:profile_image,:self_introduction,:is_active)
  end
end
