Quando /^o visitante selecionar (.*?) no select2 (.*?)$/ do |value, placeholder|
  container = page.find('.select2-container', text: placeholder)
  container.find('a.select2-choice').click
  input  = container.find("input[type='text']")
  input.set(value)
  sleep 1
  li = container.find('li', text: value)
  li.click
end
