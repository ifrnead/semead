class ParticipantesController < ApplicationController
  # GET /participantes/1
  # GET /participantes/1.json
  def show
    @participante = Participante.find(params[:id])
  end

  # GET /participantes/new
  def new
    @participante = Participante.new
  end

  # POST /participantes
  # POST /participantes.json
  def create
    @participante = Participante.new(participante_params)

    respond_to do |format|
      if @participante.save
        format.html { redirect_to @participante }
        format.json { render :show, status: :created, location: @participante }
      else
        format.html { render :new }
        format.json { render json: @participante.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def participante_params
      params.require(:participante).permit(:nome, :email, :password, :password_confirmation, :documento, :tipo_participante_id, :cidade_id, :pais_id, :instituicao, :possui_necessidades_especiais, :necessidades_especiais)
    end
end
