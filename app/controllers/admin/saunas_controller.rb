class Admin::SaunasController < ApplicationController
  def index
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
  end

  def edit
  end

  def update
  end
end
