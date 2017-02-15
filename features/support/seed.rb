# encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

print "Criando tipos de participantes... "

TipoParticipante.create(nome: "Professor do ensino superior e pós-graduação", slug: 'professor_ensino_superior_posgraduacao')
TipoParticipante.create(nome: "Professor da educação básica", slug: 'professor_educacao_basica')
TipoParticipante.create(nome: "Profissional de educação", slug: 'profissional_educacao')
TipoParticipante.create(nome: "Estudante", slug: 'estudante')
TipoParticipante.create(nome: "Outros", slug: 'outros')

puts "concluído!"

print "Criando perfis... "

admin = Perfil.create(nome: 'Administrador', slug: 'administrador')
membro_comissao_central = Perfil.create(nome: 'Membro da Comissão Central', slug: 'membro_comissao_central')
coordenador_comissao_cientifica = Perfil.create(nome: 'Coordenador da Comissão Científica', slug: 'coordenador_comissao_cientifica')
coordenador_linha_pesquisa = Perfil.create(nome: 'Coordenador de Linha de Pesquisa', slug: 'coordenador_linha_pesquisa')
membro_comissao_cientifica = Perfil.create(nome: 'Membro da Comissão Científica', slug: 'membro_comissao_cientifica')
secretario = Perfil.create(nome: 'Secretário', slug: 'secretario')
Perfil.create(nome: 'Participante', slug: 'participante')

puts "concluído!"

print "Criando usuários... "

# Admin

jalerson = Usuario.create(nome: 'Jalerson Lima', email: 'jalerson.lima@ifrn.edu.br', password: '321mud@r', perfil: admin)
jalerson = Organizador.create(usuario: jalerson)

jp = Usuario.create(nome: 'João Paulo', email: 'joao.queiroz@ifrn.edu.br', password: '321mud@r', perfil: admin)
jp = Organizador.create(usuario: jp)

# Coordenador da Comissão Científica

ana = Usuario.create(nome: 'Ana Lúcia', email: 'ana.henrique@ifrn.edu.br', password: '321mud@r', perfil: coordenador_comissao_cientifica)
ana = Organizador.create(usuario: ana)

# Coordenadores de Linha de Pesquisa

thalita = Usuario.create(nome: 'Thalita Motta', email: 'thalita.motta@ifrn.edu.br', password: '321mud@r', perfil: coordenador_linha_pesquisa)
thalita = Organizador.create(usuario: thalita)

marilia = Usuario.create(nome: 'Marília Silveira', email: 'marilia.silveira@ifrn.edu.br', password: '321mud@r', perfil: coordenador_linha_pesquisa)
marilia = Organizador.create(usuario: marilia)

edneide = Usuario.create(nome: 'Edneide Bezerra', email: 'edneide.bezerra@ifrn.edu.br', password: '321mud@r', perfil: coordenador_linha_pesquisa)
edneide = Organizador.create(usuario: edneide)

allan = Usuario.create(nome: 'Allan Garcia', email: 'allan.garcia@ifrn.edu.br', password: '321mud@r', perfil: coordenador_linha_pesquisa)
allan = Organizador.create(usuario: allan)

fabio = Usuario.create(nome: 'Fabio Silva', email: 'fabio.silva@ifrn.edu.br', password: '321mud@r', perfil: coordenador_linha_pesquisa)
fabio = Organizador.create(usuario: fabio)

# Outros usuários

alex = Usuario.create(nome: 'Alexsandro Oliveira', email: 'alexsandro.oliveira@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_central)
alex = Organizador.create(usuario: alex)

alberico = Usuario.create(nome: 'Alberico Canario', email: 'alberico.canario@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_central)
alberico = Organizador.create(usuario: alberico)

tmedeiros = Usuario.create(nome: 'Thiago Medeiros', email: 'thiago.medeiros@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_central)
tmedeiros = Organizador.create(usuario: tmedeiros)

leonardo = Usuario.create(nome: 'Leonardo Feitoza', email: 'leonardo.feitoza@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_central)
leonardo = Organizador.create(usuario: leonardo)

elizama = Usuario.create(nome: 'Elizama Lemos', email: 'elizama.lemos@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_central)
elizama = Organizador.create(usuario: elizama)

jroberto = Usuario.create(nome: 'José Roberto', email: 'jose.santos@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_central)
jroberto = Organizador.create(usuario: jroberto)

kelson = Usuario.create(nome: 'Kelson Medeiros', email: 'kelson.medeiros@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_central)
kelson = Organizador.create(usuario: kelson)

gueidson = Usuario.create(nome: 'Gueidson Lima', email: 'gueidson.lima@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
gueidson = Organizador.create(usuario: gueidson)

ilane = Usuario.create(nome: 'Ilane Cavalcanti', email: 'ilane.cavalcanti@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
ilane = Organizador.create(usuario: ilane)

ernesto = Usuario.create(nome: 'Ernesto Tacconi', email: 'ernesto.tacconi@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
ernesto = Organizador.create(usuario: ernesto)

claudia = Usuario.create(nome: 'Claudia Lima', email: 'claudia.lima@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
claudia = Organizador.create(usuario: claudia)

wagner = Usuario.create(nome: 'Wagner Oliveira', email: 'wagner.oliveira@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
wagner = Organizador.create(usuario: wagner)

abigail = Usuario.create(nome: 'Abigail Silva', email: 'abigail.silva@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
abigail = Organizador.create(usuario: abigail)

helenice = Usuario.create(nome: 'Helenice Lopes', email: 'helenice.lopes@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
helenice = Organizador.create(usuario: helenice)

ivoneide = Usuario.create(nome: 'Ivoneide Bezerra', email: 'ivoneide.bezerra@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
ivoneide = Organizador.create(usuario: ivoneide)

patricia = Usuario.create(nome: 'Patrícia Chagas', email: 'patricia.chagas@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
patricia = Organizador.create(usuario: patricia)

silvia = Usuario.create(nome: 'Silvia Mendonça', email: 'silvia.mendonca@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
silvia = Organizador.create(usuario: silvia)

maria = Usuario.create(nome: 'Maria do Socorro', email: 'maria.dantas@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
maria = Organizador.create(usuario: maria)

christine = Usuario.create(nome: 'Christine Fonseca', email: 'christine.fonseca@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
christine = Organizador.create(usuario: christine)

charles = Usuario.create(nome: 'Charles Freitas', email: 'charles.freitas@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
charles = Organizador.create(usuario: charles)

clauber = Usuario.create(nome: 'Clauber Bezerra', email: 'clauber.bezerra@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
clauber = Organizador.create(usuario: clauber)

erick = Usuario.create(nome: 'Erick Bergamini', email: 'erick.bergamini@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
erick = Organizador.create(usuario: erick)

emanuel = Usuario.create(nome: 'Emanuel Lourenço', email: 'emanuel.lourenco@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
emanuel = Organizador.create(usuario: emanuel)

rose = Usuario.create(nome: 'Rosemary Borges', email: 'rosemary.borges@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
rose = Organizador.create(usuario: rose)

douglas = Usuario.create(nome: 'Roberto Douglas', email: 'douglas.costa@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
douglas = Organizador.create(usuario: douglas)

# lidiane = Usuario.create(nome: 'Lidiane Medeiros', email: 'lidiane.medeiros@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
# lidiane = Organizador.create(usuario: lidiane)

tloureiro = Usuario.create(nome: 'Thiago Loureiro', email: 'thiago.loureiro@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
tloureiro = Organizador.create(usuario: tloureiro)

sarah = Usuario.create(nome: 'Sarah Raquel', email: 'sarah.raquel@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
sarah = Organizador.create(usuario: sarah)

liane = Usuario.create(nome: 'Liane Mariz', email: 'liane.mariz@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
liane = Organizador.create(usuario: liane)

everton = Usuario.create(nome: 'Everton Almeida', email: 'everton.almeida@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
everton = Organizador.create(usuario: everton)

adilina = Usuario.create(nome: 'Adilina Andrade', email: 'adilina.andrade@ifrn.edu.br', password: '321mud@r', perfil: membro_comissao_cientifica)
adilina = Organizador.create(usuario: adilina)

# Secretaria

isaac = Usuario.create(nome: 'Isaac Newton', email: 'isaac.ribeiro@ifrn.edu.br', password: '321mud@r', perfil: secretario)
Organizador.create(usuario: isaac)

puts "concluído!"

print "Criando linhas de pesquisa... "

linha_politicas = Linha.create(nome: 'Políticas e Institucionalização da EaD', slug: 'politicas_institucionalizacao')
linha_modelos = Linha.create(nome: 'Modelos e Experiências pedagógicas em EaD', slug: 'modelos_experiencias_pedagogicas')
linha_formacao = Linha.create(nome: 'Formação Docente em EaD', slug: 'formacao_docente')
linha_solucoes = Linha.create(nome: 'Soluções Tecnológicas para EaD', slug: 'solucoes_tecnologicas')
linha_producao = Linha.create(nome: 'Produção de Materiais Didáticos para EaD', slug: 'producao_material_didatico')

puts "concluído!"

print "Adicionando membros às linhas... "

Membro.create(linha: linha_politicas, organizador: thalita, coordenador: true)
Membro.create(linha: linha_politicas, organizador: alex, coordenador: false)
Membro.create(linha: linha_politicas, organizador: ana, coordenador: false)
Membro.create(linha: linha_politicas, organizador: elizama, coordenador: false)
Membro.create(linha: linha_politicas, organizador: gueidson, coordenador: false)
Membro.create(linha: linha_politicas, organizador: ilane, coordenador: false)
Membro.create(linha: linha_politicas, organizador: ernesto, coordenador: false)
Membro.create(linha: linha_politicas, organizador: claudia, coordenador: false)
Membro.create(linha: linha_politicas, organizador: wagner, coordenador: false)

Membro.create(linha: linha_modelos, organizador: marilia, coordenador: true)
Membro.create(linha: linha_modelos, organizador: alberico, coordenador: false)
Membro.create(linha: linha_modelos, organizador: abigail, coordenador: false)
Membro.create(linha: linha_modelos, organizador: helenice, coordenador: false)
Membro.create(linha: linha_modelos, organizador: ivoneide, coordenador: false)
Membro.create(linha: linha_modelos, organizador: patricia, coordenador: false)
Membro.create(linha: linha_modelos, organizador: silvia, coordenador: false)
#Membro.create(linha: linha_modelos, organizador: vania, coordenador: false)
Membro.create(linha: linha_modelos, organizador: maria, coordenador: false)

Membro.create(linha: linha_formacao, organizador: edneide, coordenador: true)
Membro.create(linha: linha_formacao, organizador: christine, coordenador: false)
Membro.create(linha: linha_formacao, organizador: abigail, coordenador: false)
Membro.create(linha: linha_formacao, organizador: gueidson, coordenador: false)
Membro.create(linha: linha_formacao, organizador: jroberto, coordenador: false)
Membro.create(linha: linha_formacao, organizador: patricia, coordenador: false)
Membro.create(linha: linha_formacao, organizador: silvia, coordenador: false)
Membro.create(linha: linha_formacao, organizador: sarah, coordenador: false)
Membro.create(linha: linha_formacao, organizador: liane, coordenador: false)
Membro.create(linha: linha_formacao, organizador: adilina, coordenador: false)

Membro.create(linha: linha_solucoes, organizador: allan, coordenador: true)
Membro.create(linha: linha_solucoes, organizador: charles, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: clauber, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: erick, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: jalerson, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: jp, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: wagner, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: emanuel, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: sarah, coordenador: false)
Membro.create(linha: linha_solucoes, organizador: everton, coordenador: false)

Membro.create(linha: linha_producao, organizador: fabio, coordenador: true)
Membro.create(linha: linha_producao, organizador: rose, coordenador: false)
Membro.create(linha: linha_producao, organizador: douglas, coordenador: false)
# Membro.create(linha: linha_producao, organizador: lidiane, coordenador: false)
Membro.create(linha: linha_producao, organizador: tloureiro, coordenador: false)
Membro.create(linha: linha_producao, organizador: tmedeiros, coordenador: false)

puts "concluído!"

print "Adicionando tipos de trabalhos... "

TipoTrabalho.create(nome: 'Apresentação oral', slug: 'apresentacao_oral')
TipoTrabalho.create(nome: 'Pôster', slug: 'poster')

puts "concluído!"

print "Criando países... "

Pais.create(nome: "BRASIL", name: "BRAZIL")

puts "concluído!"

brasil = Pais.find_by_nome('Brasil')

print "Criando estados... "

Estado.create(codigo: 12, nome: "Acre", sigla: "AC", pais: brasil)
Estado.create(codigo: 27, nome: "Alagoas", sigla: "AL", pais: brasil)
Estado.create(codigo: 16, nome: "Amapá", sigla: "AP", pais: brasil)
Estado.create(codigo: 13, nome: "Amazonas", sigla: "AM", pais: brasil)
Estado.create(codigo: 29, nome: "Bahia", sigla: "BA", pais: brasil)
Estado.create(codigo: 23, nome: "Ceará", sigla: "CE", pais: brasil)
Estado.create(codigo: 53, nome: "Distrito Federal", sigla: "DF", pais: brasil)
Estado.create(codigo: 32, nome: "Espírito Santo", sigla: "ES", pais: brasil)
Estado.create(codigo: 52, nome: "Goiás", sigla: "GO", pais: brasil)
Estado.create(codigo: 21, nome: "Maranhão", sigla: "MA", pais: brasil)
Estado.create(codigo: 51, nome: "Mato Grosso", sigla: "MT", pais: brasil)
Estado.create(codigo: 50, nome: "Mato Grosso do Sul", sigla: "MS", pais: brasil)
Estado.create(codigo: 31, nome: "Minas Gerais", sigla: "MG", pais: brasil)
Estado.create(codigo: 15, nome: "Pará", sigla: "PA", pais: brasil)
Estado.create(codigo: 25, nome: "Paraíba", sigla: "PB", pais: brasil)
Estado.create(codigo: 41, nome: "Paraná", sigla: "PR", pais: brasil)
Estado.create(codigo: 26, nome: "Pernambuco", sigla: "PE", pais: brasil)
Estado.create(codigo: 22, nome: "Piauí", sigla: "PI", pais: brasil)
Estado.create(codigo: 33, nome: "Rio de Janeiro", sigla: "RJ", pais: brasil)
Estado.create(codigo: 24, nome: "Rio Grande do Norte", sigla: "RN", pais: brasil)
Estado.create(codigo: 43, nome: "Rio Grande do Sul", sigla: "RS", pais: brasil)
Estado.create(codigo: 11, nome: "Rondônia", sigla: "RO", pais: brasil)
Estado.create(codigo: 14, nome: "Roraima", sigla: "RR", pais: brasil)
Estado.create(codigo: 42, nome: "Santa Catarina", sigla: "SC", pais: brasil)
Estado.create(codigo: 35, nome: "São Paulo", sigla: "SP", pais: brasil)
Estado.create(codigo: 28, nome: "Sergipe", sigla: "SE", pais: brasil)
Estado.create(codigo: 17, nome: "Tocantins", sigla: "TO", pais: brasil)

puts "concluído!"

print "Criando cidades... "

Cidade.create(estado_id: 20, codigo: 2408102, nome: "Natal")

puts "concluído!"
