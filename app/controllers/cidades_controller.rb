class CidadesController < ApplicationController
  def index
    render json: Cidade.select2(params[:q])
  end
end
