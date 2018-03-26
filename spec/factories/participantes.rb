FactoryBot.define do
  factory :participante, class: Participante do
    documento { Faker::CPF.numeric }
    tipo_participante
    cidade
    pais
    instituicao { Faker::Company.name }
    possui_necessidades_especiais false
    association :usuario, factory: :usuario_participante 
  end

  factory :tipo_participante do
    nome 'Outros'
    slug 'outros'
  end
end
