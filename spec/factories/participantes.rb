FactoryBot.define do
  factory :participante, class: Participante do
    documento { Faker::CPF.numeric }
    association :tipo_participante, factory: :tipo_participante_outros
    cidade
    pais
    instituicao { Faker::Company.name }
    possui_necessidades_especiais false
    association :usuario, factory: :usuario_participante
  end

  factory :tipo_participante_outros, class: TipoParticipante do
    nome 'Outros'
    slug 'outros'
  end

  factory :tipo_participante_estudante, class: TipoParticipante do
    nome 'Estudante'
    slug 'estudante'
  end
end
