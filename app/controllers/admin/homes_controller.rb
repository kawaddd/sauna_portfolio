class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
     # ユーザーランキング
    @user_ranks = User.all.sort { |a, b| b.likes_count <=> a.likes_count }.slice(0,3)
    # サウナランキング
    # @sauna_ranks = Sauna.all.sort { |a, b| b.likes_count <=> a.likes_count }.slice(0,3)
  end
end
