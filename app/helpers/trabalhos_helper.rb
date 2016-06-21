module TrabalhosHelper

  def situacao(situacao)
    if situacao == Avaliacao::SITUACOES[:aprovado]
      return "<span class='label label-success'>Aprovado</span>"
    elsif situacao == Avaliacao::SITUACOES[:reprovado]
      return "<span class='label label-danger'>Reprovado</span>"
    else
      return "<span class='label label-warning'>Pendente</span>"
    end
  end

end
