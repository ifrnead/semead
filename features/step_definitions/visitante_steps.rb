Dado(/^que um visitante acesse a página de inscrição do evento$/) do
  visit new_participante_path
end

Quando(/^o visitante preencher o formulário de inscrição$/) do
  @participante = build(:participante)
  @usuario = build(:usuario)

  fill_in 'participante_usuario_attributes_nome', with: @usuario.nome
  fill_in 'participante_usuario_attributes_email', with: @usuario.email
  fill_in 'participante_usuario_attributes_password', with: @usuario.password
  fill_in 'participante_usuario_attributes_password_confirmation', with: @usuario.password
  fill_in 'participante_documento', with: @participante.documento
  select "Estudante", from: 'participante_tipo_participante_id'
  fill_in 'participante_instituicao', with: @participante.instituicao
end

Quando(/^o visitante não preencher o endereço de e-mail$/) do
  @participante = build(:participante)
  @usuario = build(:usuario)

  fill_in 'participante_usuario_attributes_nome', with: @usuario.nome
  fill_in 'participante_usuario_attributes_password', with: @usuario.password
  fill_in 'participante_usuario_attributes_password_confirmation', with: @usuario.password
  fill_in 'participante_documento', with: @participante.documento
  select "Estudante", from: 'participante_tipo_participante_id'
  fill_in 'participante_instituicao', with: @participante.instituicao
end

E(/^submeter o formulário de inscrição$/) do
  within("form.new_participante") do
    find_button('Enviar').click
  end
end
