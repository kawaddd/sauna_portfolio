class Public::SearchesController < ApplicationController
  def search
    @address = params[:address]
    @saunas = Sauna.where('address LIKE ?', "%#{@address}%").page(params[:page]).per(10)
    @review = Review.new
    @count = @saunas.count
    if current_admin
      # render admin側のfile
      render 'admin/saunas/index'
    end
  end
end
