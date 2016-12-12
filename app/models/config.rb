class Config
  include Singleton

  def initialize
    @configs = {
      :dev => false,
      :data_abertura_inscricoes => Date.new(2016, 12, 7),
      :data_encerramento_inscricoes => Date.new(2017, 5, 10),
      :data_inicio_submissao_trabalhos => Date.new(2016, 12, 7),
      :data_termino_submissao_trabalhos => Date.new(2017, 2, 12),
      :data_inicio_submissao_minicursos => Date.new(2016, 12, 7),
      :data_termino_submissao_minicursos => Date.new(2017, 2, 12),
      :data_inicio_inscricoes_minicursos => Date.new(2017, 4, 4),
      :data_termino_inscricoes_minicursos => Date.new(2017, 5, 10),
      :prazo_redefinir_senha => 1, # dia
      :prazo_pagamento => 5 # dias
    }
  end

  def get(key)
    return @configs[key]
  end

  def self.dev?
    return Config.instance.get(:dev)
  end

  def self.inscricoes_abertas?
    return (Date.today >= Config.instance.get(:data_abertura_inscricoes) and Date.today <= Config.instance.get(:data_encerramento_inscricoes))
  end

  def self.permitir_submissao_trabalhos?
    return (Date.today >= Config.instance.get(:data_inicio_submissao_trabalhos) and Date.today <= Config.instance.get(:data_termino_submissao_trabalhos))
  end

  def self.permitir_submissao_minicursos?
    return (Date.today >= Config.instance.get(:data_inicio_submissao_minicursos) and Date.today <= Config.instance.get(:data_termino_submissao_minicursos))
  end

  def self.permitir_inscricao_minicursos?
    return (Date.today >= Config.instance.get(:data_inicio_inscricoes_minicursos) and Date.today <= Config.instance.get(:data_termino_inscricoes_minicursos))
  end

end
