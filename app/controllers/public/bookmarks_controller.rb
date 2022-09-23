class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  def create
    @sauna = Sauna.find(params[:sauna_id])
    bookmark = @sauna.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @sauna = Sauna.find(params[:sauna_id])
    bookmark = @sauna.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end