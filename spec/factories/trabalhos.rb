Faker::Config.locale = 'pt-BR'

FactoryBot.define do
  factory :trabalho do
    titulo { Faker::Book.title }
    resumo { Faker::Lorem.paragraph }
  end
end
