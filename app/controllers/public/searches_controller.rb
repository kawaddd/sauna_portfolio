class Public::SearchesController < ApplicationController
  def search
    @address = params[:address]
    @saunas = Sauna.where('address LIKE ?', "%#{@address}%")
    @review = Review.new
  end
end
