class MinicursosController < ApplicationController
  before_action :set_minicurso, only: [:show, :edit, :update, :destroy]
  before_action :set_participante, only: [ :create ]

  def index
    authorize! :index, Minicurso
    @minicursos = current_user.autenticavel.minicursos
  end

  def new
    authorize! :new, Minicurso
    @minicurso = Minicurso.new
  end

  def create
    authorize! :create, Minicurso
    @minicurso = Minicurso.new(minicurso_params)

    respond_to do |format|
      if @minicurso.save
        ParticipanteMailer.minicurso_proposto(@minicurso.participante, @minicurso).deliver_now
        format.html { redirect_to minicursos_path, notice: 'Minicurso proposto com sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minicurso
      @minicurso = Minicurso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def minicurso_params
      params.require(:minicurso).permit(:titulo, :justificativa, :objetivos, :metodologia, :programacao, :material, :referencias, :participante_id)
    end

    def set_participante
      params[:minicurso][:participante_id] = current_user.autenticavel.id
    end
end
