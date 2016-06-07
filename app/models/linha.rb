class Linha < ActiveRecord::Base
  has_many :membros
  has_many :organizadores, through: :membros

  include Selectable

  def coordenador
    self.membros.where(coordenador: true)
  end

  def proximo_avaliador
    if self.organizadores.empty?
      raise RuntimeError, 'Não há avaliadores para essa linha de pesquisa'
    end
    avaliacoes = self.organizadores.first.avaliacoes.size
    avaliador = self.organizadores.first
    self.organizadores.each do |organizador|
      if organizador.avaliacoes.size < avaliacoes
        avaliacoes = organizador.avaliacoes.size
        avaliador = organizador
      end
    end
    return avaliador
  end
end
