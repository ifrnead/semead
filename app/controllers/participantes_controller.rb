class ParticipantesController < ApplicationController

  def participacao
    @participante = current_user.autenticavel
    authorize! :show, @participante
  end

  def pagar
    pagamento = Pagamento.gerar(Participante.find(params[:participante_id]))
    if Rails.env.development?
      redirect_to pagamento.sandbox_init_point
    else
      redirect_to pagamento.init_point
    end
  end

  def new
    @participante = Participante.new
    @participante.usuario = Usuario.new
  end

  def create
    @participante = Participante.new(participante_params)

    respond_to do |format|
      if @participante.save
        session[:usuario_id] = @participante.usuario.id
        format.html { redirect_to participacao_path, notice: 'Inscrição realizada com sucesso!' }
        format.json { render :show, status: :created, location: @participante }
      else
        format.html { render :new }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def participante_params
      params.require(:participante).permit(:nome, :documento, :tipo_participante_id, :cidade_id, :pais_id, :instituicao, :possui_necessidades_especiais, :necessidades_especiais, usuario_attributes: [ :email, :password, :password_confirmation ])
    end
end
