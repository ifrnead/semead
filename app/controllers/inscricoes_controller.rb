class InscricoesController < ApplicationController

  def index
    @minicursos_inscritos = current_user.autenticavel.inscricoes.includes(:minicurso)
    @minicursos = Minicurso.aprovados
  end

end
