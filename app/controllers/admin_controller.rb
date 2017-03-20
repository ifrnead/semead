class AdminController < ApplicationController
  before_filter :auth_required

  def index
    if current_user.organizador?
      @trabalhos_avaliacao_pendente = current_user.autenticavel.trabalhos_avaliacao_pendente
    end
    if current_user.admin?
      @participantes_notas_empenho = Participante.where(pagamento_por_empenho: true, pago: false)
      @participantes_isentos = Participante.where(isento: Participante::ISENCAO[:solicitado])
    end
  end
end
