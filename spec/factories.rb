FactoryGirl.define do
  factory :inscricao do
    minicurso nil
    participante nil
  end
  factory :avaliacao_minicurso do
    formatacao 1
    tematica 1
    titulo 1
    relevancia 1
    coerencia 1
    compatibilidade 1
    metodologia 1
    adequacao 1
    clareza 1
    situacao 1
    parecer "MyText"
    minicurso nil
  end
  factory :usuario do
    nome "Jalerson Lima"
    email "jalerson@gmail.com"
    password '123456'
  end
end
