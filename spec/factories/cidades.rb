FactoryBot.define do
  factory :cidade do
    codigo 2408102
    nome 'Natal'
    estado
  end

  factory :estado do
    codigo 20
    nome 'Rio Grande do Norte'
    sigla 'RN'
    pais
  end

  factory :pais do
    nome 'Brasil'
    name 'Brazil'
  end
end
