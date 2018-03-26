class Config < ActiveRecord::Base
  validates :dev, :data_abertura_inscricoes, :data_encerramento_inscricoes, :data_inicio_submissao_trabalhos, :data_termino_submissao_trabalhos, :data_inicio_submissao_minicursos, :data_termino_submissao_minicursos, :data_inicio_inscricoes_minicursos, :data_termino_inscricoes_minicursos, :prazo_redefinir_senha, :prazo_pagamento, :quantidade_maxima_inscricoes_minicursos, presence: true

  before_create :garantir_singularidade

  def self.instance
    if Config.first.nil?
      raise ActiveRecord::RecordNotFound('Instancia de configuracao nao localizada! Eh preciso criar e persistir uma instancia do modelo Config')
    end
    Config.first
  end

  def dev?
    Config.first.dev
  end

  def inscricoes_abertas?
    (Date.today >= self.data_abertura_inscricoes and Date.today <= self.data_encerramento_inscricoes)
  end

  def permitir_submissao_trabalhos?
    (Date.today >= self.data_inicio_submissao_trabalhos and Date.today <= self.data_termino_submissao_trabalhos)
  end

  def permitir_submissao_minicursos?
    (Date.today >= self.data_inicio_submissao_minicursos and Date.today <= self.data_termino_submissao_minicursos)
  end

  def permitir_inscricao_minicursos?
    (Date.today >= self.data_inicio_inscricoes_minicursos and Date.today <= self.data_termino_inscricoes_minicursos)
  end

  private

  def garantir_singularidade
    if Config.count > 0
      raise Exception.new('Ja existe uma instancia de configuracao')
    end
  end

end
