class Admin::MinicursosController < ApplicationController
  before_action :set_minicurso, only: [:edit, :update, :destroy]

  def index
    authorize! :index, Minicurso
    @minicursos = Minicurso.all
  end

  def new
    authorize! :new, Minicurso
    @minicurso = Minicurso.new
  end

  def create
    @minicurso = Minicurso.new(minicurso_params)
    authorize! :new, @minicurso

    if @minicurso.save
      redirect_to admin_minicursos_path, notice: 'Minicurso cadastrado com sucesso!'
    else
      render :new
    end
  end

  def edit
    authorize! :edit, @minicurso
  end

  def update
    authorize! :update, @minicurso
    respond_to do |format|
      if @minicurso.update(minicurso_params)
        format.html { redirect_to admin_minicurso_path(@minicurso), notice: 'Minicurso atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @minicurso }
      else
        format.html { render :edit }
        format.json { render json: @minicurso.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @minicurso = Minicurso.includes(:inscricoes).find(params[:id])
    authorize! :show, @minicurso
  end

  def certificados
    authorize! :certificar, Minicurso
    @minicurso = Minicurso.includes(:inscricoes).find(params[:minicurso_id])
  end

  def participantes
    @minicurso = Minicurso.includes(:inscricoes).find(params[:minicurso_id])
    authorize! :show, @minicurso
    respond_to do |format|
      format.csv
    end
  end

  def certificar
    authorize! :certificar, Minicurso
    @minicurso = Minicurso.includes(:inscricoes).find(params[:minicurso_id])
    @minicurso.inscricoes.each do |inscricao|
      inscricao.update_attribute(:certificado, params["#{inscricao.id}"].to_i)
    end
    redirect_to admin_minicurso_certificados_path(@minicurso), notice: 'Certificação realizada com sucesso!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minicurso
      @minicurso = Minicurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minicurso_params
      params.require(:minicurso).permit(:titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, :participante_id, :vagas, :local, :avaliacao)
    end
end
