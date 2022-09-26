class Admin::SaunasController < ApplicationController
  before_action :authenticate_admin!
  def index
    # @saunas = Sauna.page(params[:page])
    @saunas = Sauna.all
  end

  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)

    if @sauna.save

      # flash[:notice] = "You have created sauna successfully."
      redirect_to admin_sauna_path(@sauna.id)
    else
      @sauna = Sauna.all
      render :new
    end
  end

  def show
    @sauna = Sauna.find(params[:id])
  end

  def edit
    @sauna = Sauna.find(params[:id])
  end

  def update
    sauna = Sauna.find(params[:id])
    sauna.update(sauna_params)
    redirect_to admin_sauna_path(sauna)
  end

  private
  def sauna_params
    params.require(:sauna).permit(:user_id,:store_name,:phone_number,:address,:transportation,:business_hours,:regular_holiday,:homepage_link,:store_image,:genre,:approval_flags)
  end
end
