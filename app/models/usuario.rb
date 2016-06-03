class Usuario < ActiveRecord::Base
  has_secure_password
  belongs_to :autenticavel, polymorphic: true
  belongs_to :perfil

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 4 }, confirmation: true

  def self.autenticar(email, senha)
    usuario = self.find_by_email(email)
    if usuario && usuario.authenticate(senha)
      return usuario
    end
    return nil
  end

  def tem_perfil?(slug)
    if self.perfil.present?
      return self.perfil.slug == slug
    end
    return false
  end

  def admin?
    self.tem_perfil?('administrador')
  end

end
