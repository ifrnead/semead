class Admin::ParticipantesController < ApplicationController
  before_action :set_participante, only: [:show, :edit, :update, :destroy]

  def show
    authorize! :show, @participante
  end

  def edit
    authorize! :update, @participante
  end

  def update
    authorize! :update, @participante
    @participante.assign_attributes(participante_params)
    if @participante.save(validate: false)
      redirect_to admin_participante_path(@participante), notice: 'Participante atualizado com sucesso!'
    else
      render :edit, alert: 'Erro ao atualizar participante!'
    end
  end

  def aprovar_nota_empenho
    authorize! :aprovar_nota_empenho, Participante
    @participante = Participante.find(params[:participante_id])
    @participante.aprovar_nota_empenho
    redirect_to admin_participante_path(@participante), notice: 'Pagamento por nota de empenho aprovada!'
  end

  def avaliar_isencao
    authorize! :avaliar_isencao, Participante
    @participante = Participante.find(params[:participante_id])
    @participante.avaliar_isencao(params[:avaliacao])
    redirect_to admin_participante_path(@participante), notice: 'Avaliação da isenção da taxa de inscrição realizada!'
  end

  def credenciar
    participante = Participante.find(params[:participante_id])
    authorize! :credenciar, participante
    if participante.confirmado?
      participante.credenciar
      redirect_to admin_participantes_path, notice: "#{participante.nome} credenciado com sucesso!"
    else
      redirect_to admin_participantes_path, error: "Não é possível credenciar um participante não-confirmado!"
    end
  end

  def new
    @participante = Participante.new
    @participante.usuario = Usuario.new
    authorize! :create, @participante
  end

  def index
    authorize! :index, Participante

    if params[:nome].nil?
      @participantes = Participante.includes(:cidade, :usuario).all
    else
      @participantes = Participante.joins(:usuario).includes(:cidade, :usuario).where("usuarios.nome LIKE \"%#{params[:nome]}%\"")
    end

    respond_to do |format|
      format.html
      format.json { render json: @participantes, include: :usuario }
      format.csv
    end
  end

  def confirmados
    authorize! :index, Participante
    @participantes = Participante.confirmados

    respond_to do |format|
      format.csv
    end
  end

  private

  def set_participante
    @participante = Participante.includes(:trabalhos, :pagamentos).find(params[:id])
  end

  def participante_params
    params.require(:participante).permit(:documento, :tipo_participante_id, :cidade_id, :pais_id, :instituicao, :possui_necessidades_especiais, :necessidades_especiais, :pagamento_por_empenho, :nota_empenho, :isento, :motivo_isencao, usuario_attributes: [ :nome, :email, :password, :password_confirmation ])
  end
end
