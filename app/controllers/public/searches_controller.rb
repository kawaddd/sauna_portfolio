class Public::SearchesController < ApplicationController
  def search
    @address = params[:address]
    @saunas = Sauna.where('address LIKE ?', "%#{@address}%")
    @review = Review.new

    if current_admin
      # redirect admin側のpath
      redirect_to admin_saunas_path
    else
      # redirect search
      redirect_to saunas_path
    end
  end
end
