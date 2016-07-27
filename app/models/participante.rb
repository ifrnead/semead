# encoding: utf-8

class Participante < ActiveRecord::Base
  belongs_to :tipo_participante
  belongs_to :cidade
  belongs_to :pais
  has_one :usuario, as: :autenticavel, dependent: :destroy
  has_many :trabalhos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy
  has_many :minicursos, dependent: :destroy

  has_attached_file :nota_empenho

  validates :pais_id, :documento, :tipo_participante_id, :instituicao, presence: true
  validates :cidade_id, presence: true, if: "pais_id == 33"
  validates :documento, cpf: true, if: "pais_id == 33"
  validates :documento, uniqueness: true
  validates :necessidades_especiais, presence: true, if: :possui_necessidades_especiais?
  validates_attachment :nota_empenho, presence: true, content_type: { content_type: "application/pdf" }, if: :pagamento_por_empenho?

  accepts_nested_attributes_for :usuario

  before_create :atribuir_perfil

  def possui_necessidades_especiais?
    self.possui_necessidades_especiais.present?
  end

  def email
    self.usuario.email
  end

  def nome
    self.usuario.nome
  end

  def atribuir_perfil
    self.usuario.perfil = Perfil.find_by_slug('participante')
  end

  def tipo?(tipo)
    return self.tipo_participante.slug == tipo
  end

  def pagamento_por_empenho?
    return self.pagamento_por_empenho
  end

  def pago?
    return self.pago
  end
end
