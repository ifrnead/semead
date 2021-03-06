require 'suap'

class Usuario < ApplicationRecord
  include Selectable

  has_secure_password validations: false
  belongs_to :autenticavel, polymorphic: true
  belongs_to :perfil
  has_many :certificados

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true, email: true, on: :create
  validates :password, length: { minimum: 4 }, confirmation: true, on: :create, if: :participante?

  def self.autenticar(email, senha)
    usuario = Usuario.find_by_email(email)
    if usuario
      if usuario.participante?
        return usuario if usuario.authenticate(senha)
      else
        begin # Organizador
          SUAP::API.authenticate(username: usuario.matricula, password: senha)
          return usuario
        rescue RestClient::BadRequest
        end
      end
    end
    false
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
    self.prazo_recuperacao_senha = DateTime.now + Config.instance.prazo_redefinir_senha
    self.save(validate: false)
    UsuarioMailer.recuperar_senha(self).deliver_now
  end

end
