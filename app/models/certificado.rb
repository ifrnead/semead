class Certificado < ActiveRecord::Base
  belongs_to :participante
  belongs_to :minicurso
  belongs_to :trabalho

  TEXTOS = {
    :inicio => "Certificamos que <strong>[PARTICIPANTE_NOME]</strong>, nascido(a) no <strong>[PARTICIPANTE_PAIS]</strong>, portador(a) do [PARTICIPANTE_TIPO_DOCUMENTO] nº  <strong>[PARTICIPANTE_DOCUMENTO]</strong>, ",
    :participacao_evento => "participou do",
    :apresentacao_trabalho => "apresentou o trabalho <strong>[TRABALHO_TITULO]</strong> no",
    :apresentacao_minicurso => "ministrou o minicurso <strong>[MINICURSO_TITULO]</strong>, com carga-horária de <strong>[MINICURSO_CH] horas</strong>, no",
    :organizacao_evento => "participou da organização do",
    :fim => " III Seminário Internacional de Educação a Distância, realizado no Campus de Educação a Distância do Instituto Federal de Educação, Ciência e Tecnologia do Rio Grande do Norte, entre os dias 10 e 12 de maio de 2017."
  }

  def to_s
    compilar
  end

  def data
    I18n.l self.created_at, format: :long
  end

  private

  def compilar
    texto = TEXTOS[:inicio]
    texto += TEXTOS[self.tipo.to_sym]
    texto += TEXTOS[:fim]
    fragmentos.each_key do |fragmento|
      texto.gsub!("[#{fragmento}]", fragmentos[fragmento]) unless fragmentos[fragmento].nil?
    end
    return texto
  end

  def fragmentos
    {
      "PARTICIPANTE_NOME" => self.participante.nome.upcase,
      "PARTICIPANTE_PAIS" => self.participante.pais.nome.upcase,
      "PARTICIPANTE_TIPO_DOCUMENTO" => self.participante.tipo_documento,
      "PARTICIPANTE_DOCUMENTO" => self.participante.documento,
      "TRABALHO_TITULO" => (self.trabalho.titulo if self.trabalho),
      "MINICURSO_TITULO" => (self.minicurso.titulo if self.minicurso),
      "MINICURSO_CH" => (self.minicurso.carga_horaria.to_s if self.minicurso)
    }
  end

end
