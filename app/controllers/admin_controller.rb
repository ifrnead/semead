class AdminController < ApplicationController
  before_action :auth_required

  def index
    if current_user.tem_perfil?('membro_comissao_cientifica') or current_user.tem_perfil?('coordenador_linha_pesquisa') or current_user.tem_perfil?('coordenador_comissao_cientifica') or current_user.tem_perfil?('membro_comissao_central') or current_user.admin?
      @trabalhos_avaliacao_pendente = current_user.autenticavel.trabalhos_avaliacao_pendente
    end
    if current_user.admin? or current_user.tem_perfil?('secretario')
      @participantes_notas_empenho = Participante.where(pagamento_por_empenho: true, pago: false)
      @participantes_isentos = Participante.where(isento: Participante::ISENCAO[:solicitado])
    end
  end
end
