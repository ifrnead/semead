class Admin::ParticipantesController < ApplicationController
  before_action :set_participante, only: [:show, :edit, :update, :destroy]

  def show
    authorize! :show, @participante
  end

  def edit
    authorize! :update, @participante
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

  def new
    @participante = Participante.new
    @participante.usuario = Usuario.new
    authorize! :create, @participante
  end

  def index
    authorize! :index, Participante
    @participantes = Participante.includes(:tipo_participante, :cidade, :pais).all
  end

  private

  def set_participante
    @participante = Participante.includes(:trabalhos, :pagamentos).find(params[:id])
  end
end
