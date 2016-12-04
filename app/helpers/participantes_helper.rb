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
    if participante.pago?
      html += "<i title='Pagamento da taxa de inscrição efetuado' class='fa fa-money' aria-hidden='true'></i>&nbsp;"
    else
      html += "<i title='Pagamento da taxa de inscrição pendente' class='fa-disabled fa fa-money' aria-hidden='true'></i>&nbsp;"
    end
    return html
  end

end
