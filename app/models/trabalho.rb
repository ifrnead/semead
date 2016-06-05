class Trabalho < ActiveRecord::Base
  belongs_to :linha
  belongs_to :participante
  belongs_to :tipo_trabalho

  before_destroy :apagar_arquivo

  validates :titulo, :resumo, :linha_id, :tipo_trabalho_id, presence: true

  has_attached_file :arquivo
  validates_attachment :arquivo, presence: true, content_type: { content_type: "application/pdf" }

  def apagar_arquivo
    self.arquivo.destroy
  end
end
