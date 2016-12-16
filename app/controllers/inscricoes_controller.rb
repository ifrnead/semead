class InscricoesController < ApplicationController

  def index
    authorize! :inscrever, Minicurso
    @minicurso = current_user.autenticavel.minicurso
    @minicursos = Minicurso.com_vagas
  end

  def new
    authorize! :inscrever, Minicurso
    minicurso = Minicurso.find(params[:minicurso_id])
    if minicurso.tem_vagas?
      current_user.autenticavel.update_attribute(:minicurso_id, minicurso.id)
      redirect_to inscricoes_path, notice: 'Inscrição realizada com sucesso!'
    else
      redirect_to inscricoes_path, alert: 'O minicurso escolhido não possui mais vagas, por favor escolha outro.'
    end
  end

  def cancelar
    current_user.autenticavel.update_attribute(:minicurso_id, nil)
    redirect_to inscricoes_path, notice: 'Cancelamento de inscrição realizado com sucesso!'
  end

end
