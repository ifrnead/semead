class Admin::TrabalhosController < ApplicationController
  before_action :set_trabalho, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, Trabalho
    if current_user.tem_perfil?('administrador') or current_user.tem_perfil?('membro_comissao_central') or current_user.tem_perfil?('coordenador_comissao_cientifica')
      @trabalhos = Trabalho.all
    elsif current_user.tem_perfil?('coordenador_linha_pesquisa') or current_user.tem_perfil?('membro_comissao_cientifica')
      @trabalhos = current_user.autenticavel.trabalhos
    end
  end

  def show
    authorize! :show, @trabalho
    if can? :index, AvaliacaoTrabalho
      @avaliacoes = @trabalho.avaliacoes
    end
  end

  def edit
    authorize! :update, @trabalho
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private

  def set_trabalho
    @trabalho = Trabalho.find(params[:id])
  end
end
