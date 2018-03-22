FactoryBot.define do
  factory :perfil_admin, class: Perfil do
    nome 'Administrador'
    slug 'administrador'
  end

  factory :perfil_participante, class: Perfil do
    nome 'Participante'
    slug 'participante'
  end
end
