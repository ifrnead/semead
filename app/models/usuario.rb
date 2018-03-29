require 'suap'

class Usuario < ActiveRecord::Base
  include Selectable

  has_secure_password validations: false
  belongs_to :autenticavel, polymorphic: true
  belongs_to :perfil
  has_many :certificados

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true, email: true, on: :create
  validates :password, length: { minimum: 4 }, confirmation: true, on: :create, if: :participante?

  def self.autenticar(username, pass)
    if username.to_i != 0
      return self.autenticar_organizador(username, pass)
    end
    self.autenticar_participante(username, pass)
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

  private

  def self.autenticar_organizador(matricula, senha)
    usuario = self.find_by_matricula(matricula)
    if usuario
      begin
        SUAP::API.authenticate(username: matricula, password: senha)
        return usuario
      rescue RestClient::BadRequest
        nil
      end
    end
    nil
  end

  def self.autenticar_participante(email, senha)
    usuario = self.find_by_email(email)
    if usuario && usuario.authenticate(senha)
      return usuario
    end
    nil
  end

end
