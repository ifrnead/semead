module ParticipantesHelper

  def icons_listagem_participante(participante)
    html = ""
    if participante.possui_necessidades_especiais?
      html += fa_icon('wheelchair', title: 'Possui necessidades especiais')
      html += "&nbsp".html_safe
    end
    if participante.pagamento_por_empenho?
      html += fa_icon('file-text-o', title: 'Pagamento da taxa de inscrição por empenho')
      html += "&nbsp".html_safe
    elsif participante.isento? or participante.solicitou_isencao? or participante.isencao_aprovada?
      html += fa_icon('credit-card', classes: 'fa-disabled', title: 'Solicitou isenção/isento')
      html += "&nbsp".html_safe
    else
      html += fa_icon('credit-card', title: 'Pagamento da taxa de inscrição tradicional')
      html += "&nbsp".html_safe
    end
    if participante.confirmado?
      html += fa_icon('thumbs-up', title: 'Confirmado')
      html += "&nbsp".html_safe
    else
      html += fa_icon('thumbs-up', classes: 'fa-disabled', title: 'Não confirmado')
      html += "&nbsp".html_safe
    end
    if participante.credenciado?
      html += fa_icon('address-card-o', title: 'Credenciado')
      html += "&nbsp".html_safe
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
