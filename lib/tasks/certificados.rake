namespace :certificados do

  desc "Certificados de participação"
  task participacao: :environment do

    print "Gerando certificados de participação para inscritos... "
    Participante.confirmados.each do |participante|
      texto = "Certificamos que <strong>#{participante.usuario.nome.upcase}</strong>, nascido(a) no <strong>#{participante.pais.nome.upcase}</strong>, portador(a) do #{participante.tipo_documento} nº <strong>#{participante.documento}</strong>, participou do III Seminário Internacional de Educação a Distância, realizado no Campus de Educação a Distância do Instituto Federal de Educação, Ciência e Tecnologia do Rio Grande do Norte, entre os dias 10 e 12 de maio de 2017."
      Certificado.create(usuario: participante.usuario, texto: texto, titulo: 'Certificado de participação')
    end
    puts "Concluído!"

    print "Gerando certificados de participação para os organizadores... "
    Organizador.all.each do |organizador|
      texto = "Certificamos que <strong>#{organizador.usuario.nome.upcase}</strong>, nascido(a) no <strong>Brasil</strong>, portador(a) do CPF nº <strong>000.000.000-00</strong>, participou do III Seminário Internacional de Educação a Distância, realizado no Campus de Educação a Distância do Instituto Federal de Educação, Ciência e Tecnologia do Rio Grande do Norte, entre os dias 10 e 12 de maio de 2017."
      Certificado.create(usuario: organizador.usuario, texto: texto, titulo: 'Certificado de participação')
    end
    puts "Concluído!"

  end

end
