class Certificado < ApplicationRecord
  belongs_to :usuario

  before_create :definir_texto, :processar_fragmentos

  INICIO = "Certificamos que "
  FINAL = " III Seminário Internacional de Educação a Distância, realizado no Campus de Educação a Distância do Instituto Federal de Educação, Ciência e Tecnologia do Rio Grande do Norte, entre os dias 10 e 12 de maio de 2017."

  def data
    I18n.l self.created_at, format: :long
  end

  private

  def definir_texto
    self.texto = INICIO + self.texto + FINAL
  end

  def processar_fragmentos
    self.texto.gsub!("[nome]", "<strong>#{self.usuario.nome}</strong>")
    self.texto.gsub!("[b]", "<strong>")
    self.texto.gsub!("[/b]", "</strong>")
  end

end
