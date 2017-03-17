require 'rails_helper'

RSpec.feature "Realizando inscrição de participante", js: true do
  scenario "O participante preenche todos os campos" do
    visit "/participantes/new"
    @participante = build(:participante)
    @usuario = build(:usuario)

    fill_in 'participante_usuario_attributes_nome', with: @usuario.nome
    fill_in 'participante_usuario_attributes_email', with: @usuario.email
    fill_in 'participante_usuario_attributes_password', with: @usuario.password
    fill_in 'participante_usuario_attributes_password_confirmation', with: @usuario.password
    fill_in 'participante_documento', with: @participante.documento
    select "Estudante", from: 'participante_tipo_participante_id'
    fill_in 'participante_instituicao', with: @participante.instituicao

    within 'form#new_participante' do
      click_button "Enviar"
    end

    page.has_content?('Inscrição realizada com sucesso!')
  end
end
