Dado(/^que um visitante acesse a página de inscrição do evento$/) do
  visit new_participante_path
end

Quando(/^o visitante preencher os campos do formulário de inscrição do evento$/) do
  @participante = build(:participante)
  @usuario = build(:usuario)

  fill_in 'participante_usuario_attributes_nome', with: @usuario.nome
  fill_in 'participante_usuario_attributes_email', with: @usuario.email
  fill_in 'participante_usuario_attributes_password', with: @usuario.password
  fill_in 'participante_usuario_attributes_password_confirmation', with: @usuario.password
  select2 "Natal", from: "Cidade", search: true
  fill_in 'participante_documento', with: @participante.documento
  select "Estudante", from: 'participante_tipo_participante_id'
  fill_in 'participante_instituicao', with: @participante.instituicao
end
