# encoding: utf-8

class Participante < ActiveRecord::Base
  include Selectable

  belongs_to :tipo_participante
  belongs_to :cidade
  belongs_to :pais
  has_one :usuario, as: :autenticavel, dependent: :destroy
  has_many :trabalhos, dependent: :destroy
  has_many :pagamentos, dependent: :destroy
  has_many :minicursos_propostos, dependent: :destroy, class_name: 'Minicurso'
  belongs_to :minicurso

  has_attached_file :nota_empenho, {
    path: "public/system/:class/:attachment/:id/:style/:filename",
    url: "system/:class/:attachment/:id/:style/:filename"
  }

  validates :pais_id, :documento, :tipo_participante_id, :instituicao, presence: true
  validates :cidade_id, presence: true, if: "pais_id == 33"
  validates :documento, cpf: true, if: "pais_id == 33"
  validates :documento, uniqueness: true
  validates :necessidades_especiais, presence: true, if: :possui_necessidades_especiais?
  validates_attachment :nota_empenho, presence: true, content_type: { content_type: "application/pdf" }, if: :pagamento_por_empenho?

  accepts_nested_attributes_for :usuario

  before_create :atribuir_perfil

  ISENCAO = {
    :rejeitado => 0,
    :solicitado => 1,
    :aprovado => 2
  }

  def download_nota_empenho
    if Rails.env.production?
      return "/semead/#{self.nota_empenho.url}"
    else
      return "/#{self.nota_empenho.url}"
    end
  end

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

  def aprovar_nota_empenho
    self.update_attribute(:pago, true)
    ParticipanteMailer.nota_empenho_aprovada(self).deliver_now
  end

  def pago?
    return self.pago
  end

  def isento?
    self.isento == ISENCAO[:aprovado]
  end

  def avaliar_isencao(avaliacao)
    self.update_attribute(:isento, avaliacao)
    if self.isencao_aprovada?
      ParticipanteMailer.isencao_aprovada(self).deliver_now
    else
      ParticipanteMailer.isencao_rejeitada(self).deliver_now
    end
  end

  def solicitou_isencao?
    self.isento == ISENCAO[:solicitado]
  end

  def isencao_aprovada?
    self.isento == ISENCAO[:aprovado]
  end

  def confirmado?
    self.pago? or self.isento?
  end

  def self.select2(params)
    participantes = Array.new
    self.joins(:usuario).where("nome LIKE '%#{params}%'").each do |participante|
      participantes << { id: participante.id, nome: participante.nome }
    end
    return participantes
  end
end
