namespace :avaliacao do

  desc "Comunicar autores sobre a aprovação e reprovação de trabalhos"
  task notificar_trabalhos: :environment do
    print "Enviando mensagem para os autores de trabalhos... "
    Trabalho.all.each do |trabalho|
      byebug
      if trabalho.aprovado?
        AvaliacaoMailer.trabalho_aprovado(trabalho).deliver_now
      else
        AvaliacaoMailer.trabalho_reprovado(trabalho).deliver_now
      end
    end
    puts "Concluído!"
  end

  desc "Notificar proponentes de minicursos sobre aprovação e reprovação de propostas"
  task notificar_minicursos: :environment do
    print "Enviando mensagem para os proponentes de minicursos... "
    Minicurso.all.each do |minicurso|
      byebug
      if minicurso.aprovado?
        AvaliacaoMailer.minicurso_aprovado(minicurso).deliver_now
      else
        AvaliacaoMailer.minicurso_reprovado(minicurso).deliver_now
      end
    end
    puts "Concluído!"
  end
end
