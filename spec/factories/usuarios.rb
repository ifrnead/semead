FactoryBot.define do
  factory :usuario do
    nome Faker::Name.name
    email Faker::Internet.email

    factory :usuario_organizador, class: Usuario do
      association :perfil, factory: :perfil_admin
      matricula Rails.application.secrets.suap_username
      password Rails.application.secrets.suap_password
    end

    factory :usuario_participante, class: Usuario do
      password Faker::Internet.password
      association :perfil, factory: :perfil_participante
    end

  end
end
