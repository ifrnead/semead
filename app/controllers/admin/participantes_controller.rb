class Admin::ParticipantesController < ApplicationController
  def index
    @participantes = Participante.includes(:tipo_participante, :cidade, :pais).all
  end
end
