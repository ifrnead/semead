class Admin::AvaliacoesController < ApplicationController
  before_filter :set_avaliacao, only: [:show, :edit, :update, :destroy]

  def index
  end

  def edit
  end

  def update
    #code
  end

  def new
  end

  def create
    #code
  end

  private

  def set_avaliacao
    @avaliacao = Avaliacao.find(params[:id])
  end

  def avaliacao_params
    params.require(:avaliacao).permit(:aprovado)
  end
end
