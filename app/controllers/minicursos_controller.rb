class MinicursosController < ApplicationController
  before_action :set_minicurso, only: [:show, :edit, :update, :destroy]
  before_action :set_participante, only: [ :create ]
  before_filter :auth_required

  def index
    authorize! :index, Minicurso
    @minicursos = current_user.autenticavel.minicursos_propostos
  end

  def new
    if Config.instance.permitir_submissao_minicursos?
      authorize! :new, Minicurso
      @minicurso = Minicurso.new
    else
      redirect_to prazo_encerrado_minicursos_path
    end
  end

  def prazo_encerrado
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

  def aceite
    @minicurso = Minicurso.find(params[:minicurso_id])
    authorize! :aceite, @minicurso
    if @minicurso.aprovado?
      respond_to do |format|
        format.pdf do
          render pdf: 'aceite',
                 layout: 'aceite',
                 orientation: 'Portrait',
                 page_size: 'A4',
                 show_as_html: params.key?('debug')
        end
      end
    else
      redirect_to minicursos_path, alert: 'Minicurso com avaliação pendente ou não aprovado!'
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
