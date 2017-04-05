include FactoryGirl::Syntax::Methods

if TipoParticipante.count == 0
  load Rails.root.join('db/seeds.rb')
end

perfil_participante = Perfil.find_by_slug('participante')

usuario_participante = Usuario.create(nome: 'Participante', email: 'participante@semead.ifrn.edu.br', password: 'semead2017', perfil: perfil_participante)

participante = build(:participante, usuario: usuario_participante)
participante.save
