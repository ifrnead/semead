class Admin::ParticipantesController < ApplicationController
  load_and_authorize_resource

  def new
    @participante = Participante.new
    @participante.usuario = Usuario.new
  end

  def index
    @participantes = Participante.includes(:tipo_participante, :cidade, :pais).all
  end
end
