class Trabalho < ActiveRecord::Base
  belongs_to :linha
  belongs_to :participante
  belongs_to :tipo_trabalho
  has_many :avaliacoes, class_name: 'AvaliacaoTrabalho', dependent: :destroy
  has_many :autores

  accepts_nested_attributes_for :autores, :reject_if => proc { |params| params['nome'].blank? }

  before_destroy :apagar_arquivo
  after_create :definir_avaliadores

  validates :titulo, :resumo, :linha_id, :tipo_trabalho_id, presence: true

  has_attached_file :arquivo, {
    path: "public/system/:class/:attachment/:id/:style/:filename",
    url: "system/:class/:attachment/:id/:style/:filename"
  }
  validates_attachment :arquivo, presence: true, content_type: { content_type: [ "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document" ] }

  def download
    "/semead/#{self.arquivo.url}"
  end

  def minha_avaliacao(organizador)
    return self.avaliacoes.where(organizador_id: organizador.id).first
  end

  def apagar_arquivo
    self.arquivo.destroy
  end

  def definir_avaliadores
    2.times { self.atribuir_avaliador }
  end

  def avaliacoes_linha_atual
    avaliadores = self.avaliadores(self.linha)
    return self.avaliacoes.where("organizador_id in (#{avaliadores.map(&:id).join(',')})")
  end

  def avaliadores(linha = nil)
    avaliadores = Array.new
    self.avaliacoes.each do |avaliacao|
      if linha.present?
        if avaliacao.organizador.linhas.include?(linha)
          avaliadores << avaliacao.organizador
        end
      else
        avaliadores << avaliacao.organizador
      end
    end
    return avaliadores
  end

  def atribuir_avaliador
    avaliadores_candidatos = (self.linha.organizadores - self.avaliadores)
    if avaliadores_candidatos.empty?
      raise RuntimeError, 'Não há avaliadores suficientes para atribuir!'
    end

    avaliacoes = avaliadores_candidatos.first.avaliacoes_trabalhos.size
    avaliador = avaliadores_candidatos.first

    avaliadores_candidatos.each do |candidato|
      if candidato.avaliacoes_trabalhos.size < avaliacoes
        avaliacoes = candidato.avaliacoes_trabalhos.size
        avaliador = candidato
      end
    end

    AvaliacaoMailer.avaliacao_atribuida(avaliador, self).deliver_now
    self.avaliacoes << AvaliacaoTrabalho.new(trabalho: self, organizador: avaliador)
  end

  def situacao
    avaliacoes = self.avaliacoes_linha_atual
    avaliacoes.each do |avaliacao|
      if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:pendente]
        return AvaliacaoTrabalho::SITUACOES[:pendente]
      end
    end

    aprovadas = 0
    reprovadas = 0
    outra_linha = 0
    avaliacoes.each do |avaliacao|
      aprovadas = aprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:aprovado]
      reprovadas = reprovadas + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:reprovado]
      outra_linha = outra_linha + 1 if avaliacao.situacao == AvaliacaoTrabalho::SITUACOES[:outra_linha]
    end

    if aprovadas > reprovadas and aprovadas > outra_linha
      return AvaliacaoTrabalho::SITUACOES[:aprovado]
    elsif reprovadas > aprovadas and reprovadas > outra_linha
      return AvaliacaoTrabalho::SITUACOES[:reprovado]
    elsif outra_linha > aprovadas and outra_linha > reprovadas
      return AvaliacaoTrabalho::SITUACOES[:outra_linha]
    else
      return AvaliacaoTrabalho::SITUACOES[:pendente]
    end
  end

  def aprovado?
    return self.situacao == AvaliacaoTrabalho::SITUACOES[:aprovado]
  end

  def reprovado?
    return self.situacao == AvaliacaoTrabalho::SITUACOES[:reprovado]
  end

  def outra_linha?
    return self.situacao == AvaliacaoTrabalho::SITUACOES[:outra_linha]
  end
end
