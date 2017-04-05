Dado(/^que um visitante se autentique com o email "([^"]*)" e a senha "([^"]*)"$/) do |email, senha|
  visit login_path
  fill_in 'email', with: email
  fill_in 'password', with: senha
  find_button('Enviar').click
end

Dado(/^visite a página de submissão de trabalhos$/) do
  visit new_trabalho_path
end

Dado(/^preencha o formulário para submeter um trabalho do tipo "([^"]*)" na linha "([^"]*)"$/) do |tipo_trabalho, linha|
  @trabalho = build(:trabalho)
  fill_in 'trabalho_titulo', with: @trabalho.titulo
  fill_in 'Resumo', with: @trabalho.resumo
  attach_file 'Arquivo (doc ou docx)', 'features/support/files/sample.docx'
  select linha, from: 'Linha'
  select tipo_trabalho, from: 'Tipo de trabalho'
end
