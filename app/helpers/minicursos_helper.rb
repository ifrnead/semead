module MinicursosHelper

  def avaliacao_minicurso(avaliacao)
    if avaliacao == Minicurso::AVALIACAO[:aprovado]
      return "<span class='label label-success'>Aprovado</span>"
    elsif avaliacao == Minicurso::AVALIACAO[:reprovado]
      return "<span class='label label-danger'>Reprovado</span>"
    else
      return "<span class='label label-default'>Pendente</span>"
    end
  end

end
