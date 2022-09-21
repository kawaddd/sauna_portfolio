class Public::Users::HozonSaunasController < ApplicationController
  def index
    @sauna = Sauna.all
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
end
