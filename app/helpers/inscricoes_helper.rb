module InscricoesHelper

  def emitir_certificado?(inscricao)
    if inscricao.certificado.nil?
      "Não"
    elsif inscricao.certificado
      "Sim"
    else
      "Não"
    end
  end

end
