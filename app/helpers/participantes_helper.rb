module ParticipantesHelper

  def icons_listagem_participante(participante)
    html = ""
    if participante.possui_necessidades_especiais?
      html += "<i title='Possui necessidades especiais' class='fa fa-wheelchair' aria-hidden='true'></i>&nbsp;"
    else
      html += "<i title='Não possui necessidades especiais' class='fa-disabled fa fa-wheelchair' aria-hidden='true'></i>&nbsp;"
    end
    if participante.pagamento_por_empenho?
      html += "<i title='Pagamento da taxa de inscrição por empenho' class='fa-disabled fa fa-credit-card' aria-hidden='true'></i>&nbsp;"
    else
      html += "<i title='Pagamento da taxa de inscrição tradicional' class='fa fa-credit-card' aria-hidden='true'></i>&nbsp;"
    end
    if participante.confirmado?
      html += "<i title='Confirmado' class='fa fa-thumbs-up' aria-hidden='true'></i>&nbsp;"
    else
      html += "<i title='Pendente' class='fa-disabled fa fa-thumbs-up' aria-hidden='true'></i>&nbsp;"
    end
    return html
  end

  def select2_default_option(participante)
    if participante.cidade.present?
      [ [ participante.cidade.nome_sigla, participante.cidade.id ] ]
    else
      cidade = Cidade.includes(:estado).where("cidades.nome = 'Natal'").first
      [ [ cidade.nome_sigla, cidade.id ] ]
    end
  end

  def isencao_options
    [ [ 'Organizador' ], [ 'Aluno do Campus EaD' ], [ 'Tutor(a) do Campus EaD' ] ]
  end

  def situacao_inscricao(participante)
    if participante.pago?
      return "<span class='label label-primary'>Pagamento confirmado</span>"
    elsif participante.pagamento_por_empenho?
      return "<span class='label label-warning'>Verificação da nota de empenho</span>"
    elsif participante.isento != nil
      if participante.isento == Participante::ISENCAO[:rejeitado]
        return "<span class='label label-danger'>Isenção rejeitada</span>"
      elsif participante.isento == Participante::ISENCAO[:solicitado]
        return "<span class='label label-warning'>Verificando isenção</span>"
      elsif participante.isento == Participante::ISENCAO[:aprovado]
        return "<span class='label label-primary'>Isenção aprovada</span>"
      end
    else
      return "<span class='label label-danger'>Pagamento pendente</span>"
    end
  end

end
