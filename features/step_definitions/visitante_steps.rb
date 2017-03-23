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

E(/^submeter o formulário de inscrição$/) do
  within("form.new_participante") do
    find_button('Enviar').click
  end
end

E(/^solicitar a isenção da taxa de inscrição por ser "([a-zA-Z]*)"$/) do |motivo_isencao|
  check 'Sou isento do pagamento da taxa de inscrição'
  select motivo_isencao, from: 'Motivo da isenção'
end

E(/^selecionar pagamento por nota de empenho$/) do
  check 'Minha taxa de inscrição será paga por nota de empenho'
  attach_file 'Nota de empenho (pdf)', 'features/support/files/sample.pdf'
end

Então(/^deve receber um email com o assunto "([^"]*)"$/) do |assunto|
  step "\"#{@usuario.email}\" deve receber um email com o assunto \"#{assunto}\""
end

Então(/^deve receber um email com o conteúdo "([^"]*)"$/) do |conteudo|
  step "\"#{@usuario.email}\" deve receber um email com o conteúdo \"#{conteudo}\""
end
