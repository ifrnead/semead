require 'spec_helper'
require 'rails_helper'

describe Usuario do
  it { expect validate_presence_of(:nome) }
  it { expect validate_presence_of(:email) }
  it { expect validate_presence_of(:password) }
  it { expect validate_confirmation_of(:password) }
  it { expect have_secure_password }
  it { expect belong_to :autenticavel }
  it { expect belong_to :perfil }

  it 'autenticacao de organizador bem sucedida' do
    create(:usuario_organizador)

    usuario = Usuario.autenticar(Rails.application.secrets.suap_username, Rails.application.secrets.suap_password)

    expect(usuario).to_not be_nil
    expect(usuario).to be_an_instance_of(Usuario)
  end

  it 'autenticacao de participante bem sucedida' do
    usuario = create(:usuario_participante)

    usuario = Usuario.autenticar(usuario.email, usuario.password)

    expect(usuario).to_not be_nil
    expect(usuario).to be_an_instance_of(Usuario)
  end

  it "autenticacao mal sucedida" do
    usuario = Usuario.autenticar('username', 'password')

    expect(usuario).to be_nil
  end
end
