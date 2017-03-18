class DefinirAtuacaoOrganizadores < ActiveRecord::Migration
  def up
    jalerson = Organizador.joins(:usuario).where("usuarios.email = 'jalerson.lima@ifrn.edu.br'").first
    jp = Organizador.joins(:usuario).where("usuarios.email = 'joao.queiroz@ifrn.edu.br'").first
    ana = Organizador.joins(:usuario).where("usuarios.email = 'ana.henrique@ifrn.edu.br'").first
    thalita = Organizador.joins(:usuario).where("usuarios.email = 'thalita.motta@ifrn.edu.br'").first
    marilia = Organizador.joins(:usuario).where("usuarios.email = 'marilia.silveira@ifrn.edu.br'").first
    edneide = Organizador.joins(:usuario).where("usuarios.email = 'edneide.bezerra@ifrn.edu.br'").first
    allan = Organizador.joins(:usuario).where("usuarios.email = 'allan.garcia@ifrn.edu.br'").first
    fabio = Organizador.joins(:usuario).where("usuarios.email = 'fabio.silva@ifrn.edu.br'").first
    alex = Organizador.joins(:usuario).where("usuarios.email = 'alexsandro.oliveira@ifrn.edu.br'").first
    alberico = Organizador.joins(:usuario).where("usuarios.email = 'alberico.canario@ifrn.edu.br'").first
    tmedeiros = Organizador.joins(:usuario).where("usuarios.email = 'thiago.medeiros@ifrn.edu.br'").first
    leonardo = Organizador.joins(:usuario).where("usuarios.email = 'leonardo.feitoza@ifrn.edu.br'").first
    elizama = Organizador.joins(:usuario).where("usuarios.email = 'elizama.lemos@ifrn.edu.br'").first
    jroberto = Organizador.joins(:usuario).where("usuarios.email = 'jose.santos@ifrn.edu.br'").first
    kelson = Organizador.joins(:usuario).where("usuarios.email = 'kelson.medeiros@ifrn.edu.br'").first
    gueidson = Organizador.joins(:usuario).where("usuarios.email = 'gueidson.lima@ifrn.edu.br'").first
    ilane = Organizador.joins(:usuario).where("usuarios.email = 'ilane.cavalcanti@ifrn.edu.br'").first
    ernesto = Organizador.joins(:usuario).where("usuarios.email = 'ernesto.tacconi@ifrn.edu.br'").first
    claudia = Organizador.joins(:usuario).where("usuarios.email = 'claudia.lima@ifrn.edu.br'").first
    wagner = Organizador.joins(:usuario).where("usuarios.email = 'wagner.oliveira@ifrn.edu.br'").first
    abigail = Organizador.joins(:usuario).where("usuarios.email = 'abigail.silva@ifrn.edu.br'").first
    helenice = Organizador.joins(:usuario).where("usuarios.email = 'helenice.lopes@ifrn.edu.br'").first
    ivoneide = Organizador.joins(:usuario).where("usuarios.email = 'ivoneide.bezerra@ifrn.edu.br'").first
    patricia = Organizador.joins(:usuario).where("usuarios.email = 'patricia.chagas@ifrn.edu.br'").first
    silvia = Organizador.joins(:usuario).where("usuarios.email = 'silvia.mendonca@ifrn.edu.br'").first
    maria = Organizador.joins(:usuario).where("usuarios.email = 'maria.dantas@ifrn.edu.br'").first
    christine = Organizador.joins(:usuario).where("usuarios.email = 'christine.fonseca@ifrn.edu.br'").first
    charles = Organizador.joins(:usuario).where("usuarios.email = 'charles.freitas@ifrn.edu.br'").first
    clauber = Organizador.joins(:usuario).where("usuarios.email = 'clauber.bezerra@ifrn.edu.br'").first
    erick = Organizador.joins(:usuario).where("usuarios.email = 'erick.bergamini@ifrn.edu.br'").first
    emanuel = Organizador.joins(:usuario).where("usuarios.email = 'emanuel.lourenco@ifrn.edu.br'").first
    rose = Organizador.joins(:usuario).where("usuarios.email = 'rosemary.borges@ifrn.edu.br'").first
    douglas = Organizador.joins(:usuario).where("usuarios.email = 'douglas.costa@ifrn.edu.br'").first
    tloureiro = Organizador.joins(:usuario).where("usuarios.email = 'thiago.loureiro@ifrn.edu.br'").first
    sarah = Organizador.joins(:usuario).where("usuarios.email = 'sarah.raquel@ifrn.edu.br'").first
    liane = Organizador.joins(:usuario).where("usuarios.email = 'liane.mariz@ifrn.edu.br'").first
    everton = Organizador.joins(:usuario).where("usuarios.email = 'everton.almeida@ifrn.edu.br'").first
    adilina = Organizador.joins(:usuario).where("usuarios.email = 'adilina.andrade@ifrn.edu.br'").first
    isaac = Organizador.joins(:usuario).where("usuarios.email = 'isaac.ribeiro@ifrn.edu.br'").first

    jalerson.update_attributes(atuacao: 'membro da Comissão Organizadora Central e avaliador da linha de pesquisa de Soluções Tecnológicas para EaD')
    jp.update_attributes(atuacao: 'coordenador geral e avaliador da linha de pesquisa de Soluções Tecnológicas para EaD')
    ana.update_attributes(atuacao: 'coordenadora da Comissão Científica, membro da Comissão Organizadora Central e avaliadora da linha de pesquisa de Políticas e Institucionalização da EaD')
    thalita.update_attributes(atuacao: 'membro da Comissão Organizadora Central, avaliadora e coordenadora da linha de pesquisa de Políticas e Institucionalização da EaD')
    marilia.update_attributes(atuacao: 'avaliadora e coordenadora da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    edneide.update_attributes(atuacao: 'avaliadora, coordenadora da linha de pesquisa de Formação Docente em EaD e membro da Comissão Organizadora Central')
    allan.update_attributes(atuacao: 'avaliador e coordenador da linha de pesquisa de Soluções Tecnológicas para EaD')
    fabio.update_attributes(atuacao: 'avaliador e coordenador da linha de pesquisa de Produção de Materiais Didáticos para EaD')
    alex.update_attributes(atuacao: 'membro da Comissão Organizadora Central e avaliador da linha de pesquisa de Políticas e Institucionalização da EaD')
    alberico.update_attributes(atuacao: 'membro da Comissão Organizadora Central e avaliador da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    tmedeiros.update_attributes(atuacao: 'Avaliador da linha de pesquisa de Produção de Materiais Didáticos para EaD, membro da Comissão Organizadora Central e da Comissão de Infraestrutura e Logística')
    leonardo.update_attributes(atuacao: 'membro da Comissão Organizadora Central e da Comissão de Comunicação Social e Divulgação')
    elizama.update_attributes(atuacao: 'membro da Comissão Organizadora Central e avaliadora da linha de pesquisa de Políticas e Institucionalização da EaD')
    jroberto.update_attributes(atuacao: 'membro da Comissão Organizadora Central e avaliador da linha de pesquisa de Formação Docente em EaD')
    kelson.update_attributes(atuacao: 'membro da Comissão de Infraestrutura e Logística')
    gueidson.update_attributes(atuacao: 'avaliador da linha de pesquisa de Políticas e Institucionalização da EaD')
    ilane.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Políticas e Institucionalização da EaD')
    ernesto.update_attributes(atuacao: 'secretário e avaliador da linha de pesquisa de Políticas e Institucionalização da EaD')
    claudia.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Políticas e Institucionalização da EaD')
    wagner.update_attributes(atuacao: 'avaliador da linha de pesquisa de Soluções Tecnológicas para EaD')
    abigail.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    helenice.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    ivoneide.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    patricia.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    silvia.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    maria.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Modelos e Experiências Pedagógicas em EaD')
    christine.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Formação Docente em EaD')
    charles.update_attributes(atuacao: 'avaliador da linha de pesquisa de Soluções Tecnológicas para EaD')
    clauber.update_attributes(atuacao: 'avaliador da linha de pesquisa de Soluções Tecnológicas para EaD')
    erick.update_attributes(atuacao: 'avaliador da linha de pesquisa de Soluções Tecnológicas para EaD, membro da Comissão Organizadora Central e da Comissão de Infraestrutura e Logística')
    emanuel.update_attributes(atuacao: 'avaliador da linha de pesquisa de Soluções Tecnológicas para EaD')
    rose.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Produção de Materiais Didáticos para EaD e membro da Comissão de Comunicação Social e Divulgação')
    douglas.update_attributes(atuacao: 'avaliador da linha de pesquisa de Produção de Materiais Didáticos para EaD')
    tloureiro.update_attributes(atuacao: 'secretário, membro da Comissão de Infraestrutura e Logística e avaliador da linha de pesquisa de Produção de Materiais Didáticos para EaD')
    sarah.update_attributes(atuacao: 'membro da Comissão de Infraestrutura e Logística, e avaliadora da linha de pesquisa de Formação Docente em EaD')
    liane.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Formação Docente em EaD')
    everton.update_attributes(atuacao: 'avaliador da linha de pesquisa de Soluções Tecnológicas para EaD')
    adilina.update_attributes(atuacao: 'avaliadora da linha de pesquisa de Formação Docente em EaD')
    isaac.update_attributes(atuacao: 'secretário')
  end

  def down
    Organizador.update_all(atuacao: nil)
  end
end
