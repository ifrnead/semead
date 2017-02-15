E(/^clicar em "(.*?)"$/) do |botao|
  find_button(botao).click
end

Então(/^deve ver a mensagem "(.*?)"$/) do |mensagem|
  page.has_content?(mensagem)
end
