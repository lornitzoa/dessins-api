class DessinsController < ApplicationController

  def index
    render json: Dessin.all
  end

end
