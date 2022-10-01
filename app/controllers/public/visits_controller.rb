class Public::VisitsController < ApplicationController
  before_action :authenticate_user!
  def create
    @sauna = Sauna.find(params[:sauna_id])
    visit = @sauna.visits.new(user_id: current_user.id)
    if visit.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @sauna = Sauna.find(params[:sauna_id])
    visit = @sauna.visits.find_by(user_id: current_user.id)
    if visit.present?
        visit.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
