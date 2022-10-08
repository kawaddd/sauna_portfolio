class Public::HomesController < ApplicationController
  def top
    # ユーザーランキング
    @user_ranks = User.all.sort { |a, b| b.likes_count <=> a.likes_count }.slice(0,3)
    # サウナランキング
    # @sauna_ranks = Sauna.all.sort { |a, b| b.likes_count <=> a.likes_count }.slice(0,3)
  end

  def about
  end
end
