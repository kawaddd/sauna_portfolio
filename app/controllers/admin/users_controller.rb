class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @count = User.all.count
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user)
  end

  private
  def user_params
    params.require(:user).permit(:email,:nickname,:first_name,:profile_image,:self_introduction,:birth_date,:gender,:is_active)
  end
end
