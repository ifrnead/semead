Faker::Config.locale = 'pt-BR'

FactoryBot.define do
  factory :participante do
    documento { Faker::CPF.numeric }
    cidade_id 3238 # Natal
    pais_id 33 # Brasil
    instituicao { Faker::Company.name }
    tipo_participante_id { Faker::Number.between(1, 5) }
  end

  factory :usuario do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
