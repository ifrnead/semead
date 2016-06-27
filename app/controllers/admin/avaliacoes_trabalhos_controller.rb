class Admin::AvaliacoesTrabalhosController < ApplicationController
  before_action :set_avaliacao, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :index, AvaliacaoTrabalho
    @trabalho = Trabalho.includes(:avaliacoes).find(params[:trabalho_id])
    @avaliacoes = @trabalho.avaliacoes
  end

  def show
    authorize! :show, @avaliacao
  end

  def edit
    authorize! :edit, @avaliacao
  end

  def update
    authorize! :update, @avaliacao

    respond_to do |format|
      if @avaliacao.update(avaliacao_params)
        format.html { redirect_to @avaliacao, notice: 'Avaliação atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @avaliacao }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_avaliacao
    @avaliacao = AvaliacaoTrabalho.includes(:trabalho).find(params[:id])
  end

  def avaliacao_params
    params.require(:avaliacao_trabalho).permit(:atende_normas, :tematica_evento, :tematica_linha, :linha_id, :relevancia, :adequacao, :consistencia, :interlocucao, :originalidade, :situacao, :parecer)
  end
end
