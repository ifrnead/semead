json.array!(@trabalhos) do |trabalho|
  json.extract! trabalho, :id, :titulo, :resumo, :linha_id, :participante_id, :tipo_trabalho_id
  json.url trabalho_url(trabalho, format: :json)
end
