class Admin::MinicursosController < ApplicationController
  def index
    authorize! :index, Minicurso
    @minicursos = Minicurso.all
  end

  def edit
  end

  def show
    @minicurso = Minicurso.find(params[:id])
    authorize! :show, @minicurso
  end
end
