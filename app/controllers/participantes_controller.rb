class ParticipantesController < ApplicationController

  def confirmacao
    @participante = Participante.find(session[:participante_id])
  end

  def new
    @participante = Participante.new
  end

  def create
    @participante = Participante.new(participante_params)

    respond_to do |format|
      if @participante.save
        session[:participante_id] = @participante.id
        format.html { redirect_to confirmacao_participantes_path }
        format.json { render :show, status: :created, location: @participante }
      else
        format.html { render :new }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def participante_params
      params.require(:participante).permit(:nome, :email, :password, :password_confirmation, :documento, :tipo_participante_id, :cidade_id, :pais_id, :instituicao, :possui_necessidades_especiais, :necessidades_especiais)
    end
end
