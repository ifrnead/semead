class Admin::ParticipantesController < ApplicationController
  before_action :set_participante, only: [:show, :edit, :update, :destroy]

  def show
    authorize! :show, @participante
  end

  def edit
    authorize! :update, @participante
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
    @participante = Participante.includes(:trabalhos).find(params[:id])
  end
end
