class Cidade < ActiveRecord::Base
  include Selectable
  belongs_to :estado

  def nome_sigla
    "#{self.nome} (#{self.estado.sigla})"
  end

  def self.select2(params)
    cidades = Array.new
    self.includes(:estado).where("cidades.nome LIKE '%#{params}%'").each do |cidade|
      cidades << { id: cidade.id, nome: cidade.nome_sigla }
    end
    return cidades
  end
end
