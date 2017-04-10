class Certificado < ActiveRecord::Base
  belongs_to :usuario

  def data
    I18n.l self.created_at, format: :long
  end

end
