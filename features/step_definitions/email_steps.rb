
Então /^"([^"]*)" deve receber um email com o assunto "([^"]*)"$/ do |email, assunto|
  open_email(email)
  expect(current_email.subject).to eq assunto
end

Então /^"([^"]*)" deve receber um email com o conteúdo "([^"]*)"$/ do |email, conteudo|
  open_email(email)
  expect(current_email).to have_content conteudo
end
