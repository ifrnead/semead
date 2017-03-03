class Admin::TrabalhosController < ApplicationController
  before_action :set_trabalho, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, Trabalho
    if current_user.tem_perfil?('administrador') or current_user.tem_perfil?('membro_comissao_central') or current_user.tem_perfil?('coordenador_comissao_cientifica') or current_user.tem_perfil?('secretario')
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
    @avaliacao = @trabalho.minha_avaliacao(current_user.autenticavel)
  end

  def edit
    authorize! :update, @trabalho
  end

  def update
    authorize! :update, @trabalho
    respond_to do |format|
      if @trabalho.update(trabalho_params)
        format.html { redirect_to @trabalho, notice: 'Trabalho atualizado com sucesso!' }
        format.json { render :show, status: :ok, location: @trabalho }
      else
        format.html { render :edit }
        format.json { render json: @trabalho.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :destroy, @trabalho
    @trabalho.destroy
    respond_to do |format|
      format.html { redirect_to trabalhos_url, notice: 'Trabalho excluído com sucesso!' }
      format.json { head :no_content }
    end
  end

  def avaliar
    trabalho = Trabalho.find(params[:trabalho_id])
    authorize! :show, trabalho
    avaliacao = trabalho.minha_avaliacao(current_user.autenticavel)
    if avaliacao.present?
      redirect_to edit_admin_trabalho_avaliacao_path(trabalho, avaliacao)
    else
      redirect_to admin_trabalhos_path, alert: 'Você não é avaliador desse trabalho!'
    end
  end

  private

  def set_trabalho
    @trabalho = Trabalho.find(params[:id])
  end
end
