module TrabalhosHelper

  def situacao(situacao)
    if situacao == AvaliacaoTrabalho::SITUACOES[:aprovado]
      return "<span class='label label-success'>Aprovado</span>"
    elsif situacao == AvaliacaoTrabalho::SITUACOES[:reprovado]
      return "<span class='label label-danger'>Reprovado</span>"
    elsif situacao == AvaliacaoTrabalho::SITUACOES[:outra_linha]
      return "<span class='label label-warning'>Outra linha</span>"
    else
      return "<span class='label label-default'>Pendente</span>"
    end
  end

end
