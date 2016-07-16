class ParticipantesController < ApplicationController

  def participacao
    @participante = current_user.autenticavel
    authorize! :show, @participante
  end

  def pagar
    participante = Participante.find(params[:participante_id])
    pagamento = nil
    participante.pagamentos.each do |pgto|
      if Date.today <= pgto.expira_em
        pagamento = pgto
        break
      end
    end
    if pagamento.nil?
      pagamento = Pagamento.gerar(participante)
    end
    if Config.dev?
      redirect_to pagamento.sandbox_init_point
    else
      redirect_to pagamento.init_point
    end
  end

  def new
    if Config.inscricoes_abertas?
      @participante = Participante.new
      @participante.usuario = Usuario.new
      render 'new', layout: 'publico'
    else
      redirect_to inscricoes_encerradas_path
    end
  end

  def create
    @participante = Participante.new(participante_params)
    respond_to do |format|
      if @participante.save
        session[:usuario_id] = @participante.usuario.id
        ParticipanteMailer.inscricao_realizada(@participante).deliver_now
        format.html { redirect_to participacao_path, notice: 'Inscrição realizada com sucesso!' }
        format.json { render :show, status: :created, location: @participante }
      else
        format.html { render :new }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  def inscricoes_encerradas
  end

  private

    def participante_params
      params.require(:participante).permit(:documento, :tipo_participante_id, :cidade_id, :pais_id, :instituicao, :possui_necessidades_especiais, :necessidades_especiais, :pagamento_por_empenho, :nota_empenho, usuario_attributes: [ :nome, :email, :password, :password_confirmation ])
    end
end
