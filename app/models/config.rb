class Config
  include Singleton

  def initialize
    @configs = {
      :dev => true,
      :data_abertura_inscricoes => Date.new(2016, 7, 1),
      :data_encerramento_inscricoes => Date.new(2016, 11, 30),
      :data_inicio_submissao_trabalhos => Date.new(2016, 7, 1),
      :data_termino_submissao_trabalhos => Date.new(2016, 8, 1),
      :data_inicio_submissao_minicursos => Date.new(2016, 7, 1),
      :data_termino_submissao_minicursos => Date.new(2016, 8, 1),
      :data_inicio_inscricoes_minicursos => Date.new(2016, 7, 1),
      :data_termino_inscricoes_minicursos => Date.new(2016, 8, 1),
      :prazo_redefinir_senha => 1 # dia
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
