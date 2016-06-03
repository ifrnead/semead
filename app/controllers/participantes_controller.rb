class ParticipantesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [ :new, :create ]

  def participacao
    @participante = current_user.autenticavel
    authorize! :see, @participante
  end

  def new
    @participante = Participante.new
    @participante.usuario = Usuario.new
  end

  def create
    @participante = Participante.new(participante_params)

    respond_to do |format|
      if @participante.save
        session[:usuario_id] = @participante.id
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
