class AvaliacaoTrabalho < ActiveRecord::Base
  belongs_to :trabalho
  belongs_to :organizador
  belongs_to :linha

  before_create :definir_situacao

  validates :situacao, :atende_normas, :tematica_evento, :relevancia, :adequacao, :consistencia, :interlocucao, :originalidade, presence: true
  validates :parecer, presence: true, if: :reprovado?
  validates :linha_id, presence: true, if: :outra_linha?

  SITUACOES = {
    reprovado: -1,
    pendente: 0,
    aprovado: 1,
    outra_linha: 2
  }

  ATENDE_NORMAS = {
    sim: 1,
    nao: 0
  }

  TEMATICA_EVENTO = {
    sim: 1,
    nao: 0
  }

  ITENS = {
    atende: 1,
    parcialmente: 0,
    nao_atende: -1
  }

  def reprovado?
    self.situacao == SITUACOES[:reprovado]
  end

  def aprovado?
    self.situacao == SITUACOES[:aprovado]
  end

  def outra_linha?
    self.situacao == SITUACOES[:outra_linha]
  end

  def pendente?
    self.situacao == SITUACOES[:pendente]
  end

  def definir_situacao
    self.situacao = SITUACOES[:pendente]
  end
end
