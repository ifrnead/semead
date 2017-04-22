class InscricoesController < ApplicationController
  before_filter :auth_required
  before_filter :inscricoes_abertas?, only: [ :new, :create ]

  def index
    authorize! :index, Inscricao
    @inscricoes = current_user.autenticavel.inscricoes.includes(:minicurso)
    @minicursos = Minicurso.com_vagas
  end

  def new
    authorize! :new, Inscricao
    minicurso = Minicurso.find(params[:minicurso_id])
    if minicurso
      if minicurso.tem_vagas?
        @inscricao = Inscricao.new(minicurso: minicurso, participante: current_user.autenticavel)
        current_user.autenticavel.update_attribute(:minicurso_id, minicurso.id)
        redirect_to inscricoes_path, notice: 'Inscrição realizada com sucesso!'
      else
        redirect_to inscricoes_path, alert: 'O minicurso escolhido não possui mais vagas, por favor escolha outro.'
      end
    else
      redirect_to inscricoes_path, alert: 'Minicurso inexistente!'
    end
  end

  def create
    authorize! :new, Inscricao
    inscricao = Inscricao.new(minicurso_id: params[:minicurso_id], participante_id: current_user.autenticavel.id)
    if inscricao.save
      redirect_to inscricoes_path, notice: 'Inscrição realizada com sucesso!'
    else
      redirect_to inscricoes_path, alert: 'Não foi possível realizar a sua inscrição!'
    end
  end

  def cancelar
    inscricao = Inscricao.find(params[:inscricao_id])
    authorize! :cancelar, inscricao
    if inscricao
      inscricao.delete
      redirect_to inscricoes_path, notice: 'Cancelamento de inscrição realizado com sucesso!'
    else
      redirect_to inscricoes_path, alert: 'Inscrição não localizada!'
    end
  end

  def encerradas
  end

  private

  def inscricoes_abertas?
    unless Config.permitir_inscricao_minicursos?
      redirect_to encerradas_inscricoes_path
    end
  end

end
