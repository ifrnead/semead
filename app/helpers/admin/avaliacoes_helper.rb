module Admin::AvaliacoesHelper

  def avaliador?(organizador, trabalho)
    trabalho.avaliacoes.each do |avaliacao|
      if avaliacao.organizador.id == organizador.id
        return true
      end
    end
    return false
  end

end
