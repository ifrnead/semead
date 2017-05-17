namespace :certificados do

  desc "Gerar todos os certificados"
  task gerar: :environment do
    Rake::Task["certificados:participacao"].execute
    Rake::Task["certificados:apresentacao_trabalho"].execute
    Rake::Task["certificados:aprovacao_trabalho"].execute
    Rake::Task["certificados:apresentacao_minicurso"].execute
    Rake::Task["certificados:participacao_minicurso"].execute
    Rake::Task["certificados:organizacao"].execute
  end

  desc "Certificados de participação"
  task participacao: :environment do

    print "Gerando certificados de participação para inscritos... "
    Participante.credenciados.each do |participante|
      texto = "<strong>#{participante.usuario.nome.upcase}</strong>, nascido(a) no <strong>#{participante.pais.nome.upcase}</strong>, participou do"
      Certificado.create(usuario: participante.usuario, texto: texto, titulo: 'Certificado de participação')
    end
    puts "Concluído!"

    print "Gerando certificados de participação para os organizadores... "
    Organizador.all.each do |organizador|
      texto = "<strong>#{organizador.usuario.nome.upcase}</strong>, nascido(a) no <strong>Brasil</strong>, participou do"
      Certificado.create(usuario: organizador.usuario, texto: texto, titulo: 'Certificado de participação')
    end
    puts "Concluído!"

  end

  desc "Certificados de apresentação de trabalhos"
  task apresentacao_trabalho: :environment do
    print "Gerando certificados de apresentação de trabalhos... "
    Trabalho.aprovados.each do |trabalho|
      texto = "<strong>#{trabalho.participante.nome.upcase}</strong>, nascido(a) no <strong>#{trabalho.participante.pais.nome.upcase}</strong>, apresentou o trabalho <strong>#{trabalho.titulo.upcase}</strong>, na modalidade #{trabalho.tipo_trabalho},"
      Certificado.create(usuario: trabalho.participante.usuario, texto: texto, titulo: 'Certificado de apresentação de trabalho')
    end
    puts "Concluído!"
  end

  desc "Certificados de aprovação de trabalhos"
  task aprovacao_trabalho: :environment do
    print "Gerando certificados de aprovação de trabalhos... "
    Trabalho.aprovados.each do |trabalho|
      texto = "<strong>#{trabalho.participante.nome.upcase}</strong>, nascido(a) no <strong>#{trabalho.participante.pais.nome.upcase}</strong>, aprovou o trabalho <strong>#{trabalho.titulo.upcase}</strong>, na modalidade #{trabalho.tipo_trabalho},"
      Certificado.create(usuario: trabalho.participante.usuario, texto: texto, titulo: 'Certificado de aprovação de trabalho')

      trabalho.autores.each do |autor|
        texto = "<strong>#{autor.nome.upcase}</strong>, nascido(a) no <strong>Brasil</strong>, aprovou o trabalho <strong>#{trabalho.titulo.upcase}</strong>, na modalidade #{trabalho.tipo_trabalho}, no"
        Certificado.create(usuario: trabalho.participante.usuario, texto: texto, titulo: "Certificado de aprovação de trabalho (#{autor.nome.upcase})")
      end
    end
    puts "Concluído!"
  end

  desc "Certificados de apresentação de minicursos"
  task apresentacao_minicurso: :environment do
    print "Gerando certificados de apresentação de minicursos... "
    Minicurso.aprovados.each do |minicurso|
      texto = "<strong>#{minicurso.participante.nome.upcase}</strong>, nascido(a) no <strong>#{minicurso.participante.pais.nome.upcase}</strong>, ministrou o minicurso <strong>#{minicurso.titulo.upcase}</strong>, com carga-horária de 4 horas, no"
      Certificado.create(usuario: minicurso.participante.usuario, texto: texto, titulo: 'Certificado de apresentação de minicurso')
    end
    puts "Concluído!"
  end

  desc "Certificados de participação em minicursos"
  task participacao_minicurso: :environment do
    print "Gerando certificados de participação em minicursos... "
    Inscricao.emitir_certificados.each do |inscricao|
      texto = "<strong>#{inscricao.participante.nome.upcase}</strong>, nascido(a) no <strong>#{inscricao.participante.pais.nome.upcase}</strong>, participou do minicurso <strong>#{inscricao.minicurso.titulo.upcase}</strong>, com carga-horária de 4 horas, no"
      Certificado.create(usuario: inscricao.participante.usuario, texto: texto, titulo: 'Certificado de participação de minicurso')
    end
    puts "Concluído!"
  end

  desc "Certificados de organização"
  task organizacao: :environment do
    print "Gerando certificados de organização... "
    Organizador.all.each do |organizador|
      texto = "<strong>#{organizador.nome.upcase}</strong>, nascido(a) no <strong>Brasil</strong>, atuou como #{organizador.atuacao}, na organização do"
      Certificado.create(usuario: organizador.usuario, texto: texto, titulo: 'Certificado de organização')
    end

    Participante.isentos.each do |participante|
      if participante.motivo_isencao == 'Organizador'
        texto = "<strong>#{participante.nome.upcase}</strong>, nascido(a) no <strong>#{participante.pais.nome.upcase}</strong>, atuou na organização do"
        Certificado.create(usuario: participante.usuario, texto: texto, titulo: 'Certificado de organização')
      end
    end
    puts "Concluído!"
  end

end
