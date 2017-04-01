# language: pt

Funcionalidade: Submissão de trabalho
  Como um participante inscrito
  Quero submeter um trabalho de pesquisa
  De modo que eu possa apresentá-lo

  Contexto:
    Dado que um visitante se autentique com o email "participante@semead.ifrn.edu.br" e a senha "semead2017"
    E visite a página de submissão de trabalhos

  Cenário: Submissão bem-sucedida
    E preencha o formulário para submeter um trabalho do tipo "Apresentação oral" na linha "Soluções Tecnológicas para EaD"
    E clicar em "Enviar"
