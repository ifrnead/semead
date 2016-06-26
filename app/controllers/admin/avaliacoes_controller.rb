class Admin::AvaliacoesController < ApplicationController
  def index
    can? :index, AvaliacaoTrabalho
    @trabalho = Trabalho.includes(:avaliacoes).find(params[:trabalho_id])
    @avaliacoes = @trabalho.avaliacoes
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
end
