class TipoTrabalho < ActiveRecord::Base
  has_many :trabalhos

  include Selectable

  def to_s
    if self.slug == 'apresentacao_oral'
      return "artigo"
    else
      return "pôster"
    end
  end
end
