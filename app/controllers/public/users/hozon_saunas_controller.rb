class Public::Users::HozonSaunasController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end
end
