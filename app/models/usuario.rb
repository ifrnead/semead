class Usuario < ActiveRecord::Base
  has_secure_password
  belongs_to :autenticavel, polymorphic: true
  belongs_to :perfil

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 4 }, confirmation: true, on: :create

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

  def organizador?
    self.autenticavel_type == 'Organizador'
  end

  def participante?
    self.autenticavel_type == 'Participante'
  end

  def gerar_codigo_recuperacao_senha
    self.codigo_recuperar_senha = SecureRandom.hex
    self.prazo_recuperacao_senha = DateTime.now + Config.instance.get(:prazo_redefinir_senha)
    self.save(validate: false)
    UsuarioMailer.recuperar_senha(self).deliver_now
  end

end
