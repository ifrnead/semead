# Seminário Internacional de Educação a Distância (SEMEAD)

Sistema de gerenciamento de inscrições, pagamentos, submissão e avaliação de trabalhos, submissão e avaliação de minicursos, gerenciamento de usuários, credenciamento e emissão de certificados do Seminário Internacional de Educação a Distância.

## Setup

1. Baixe o projeto e instale as dependências

```
$ git clone https://github.com/ifrnead/semead.git
$ cd semead
$ bundle install
```

2. Configure o acesso ao banco de dados em `config/database.yml`

3. Configure os dados iniciais em `db/seeds.rb`

4. Em seguida, execute os comandos abaixo para preparar o banco de dados

```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Em seguida, configure o model `app/models/config.rb`

## Tasks disponveis

Quando em produção, é preciso incluir o parâmetro `RAILS_ENV=production`

### Avaliação de trabalhos e minicursos

Comunicar autores sobre a aprovação e reprovação de trabalhos: `rake avaliacao:notificar_trabalhos`

Notificar proponentes de minicursos sobre aprovação e reprovação de propostas: `rake avaliacao:notificar_minicursos`

### Emissão de certificados

Emitir todos os certificados: `rake certificados:gerar`

Emitir apenas certificados de participação (1): `rake certificados:participacao`

Emitir apenas certificados de apresentação de trabalhos (2): `rake certificados:apresentacao_trabalho`

Emitir apenas certificados de aprovação de trabalhos (2): `rake certificados:aprovacao_trabalho`

Emitir apenas certificados de apresentação de minicursos (3): `rake certificados:apresentacao_minicurso`

Emitir apenas certificados de participação em minicursos (4): `rake certificados:participacao_minicurso`

Emitir apenas certificados de organização (5): `rake certificados:organizacao`

(1) Os certificados de participação serão emitidos para todos os participantes que se credenciaram

(2) Os certificados de apresentação e de aprovação de trabalhos serão emitidos para todos os trabalhos aprovados

(3) Os certificados de apresentação de minicursos serão emitidos para todos os minicursos aprovados

(4) É preciso, antes de emitir os certificados de participação em minicursos, lançar, no sistema, quais participantes devem receber o certificado

(5) É preciso, antes de emitir os certificados de organização, lançar, no sistema, a atuação dos organizadores

## Licença

<p align="justify">
  O sistema está disponível sob a licença <a href="http://creativecommons.org/licenses/by-sa/4.0/">Creative
  Commons Attribution-ShareAlike 4.0 International License</a>, o que significa que você pode utilizá-lo, sem
  custos, mesmo para fins comerciais, e também pode fazer adaptações, desde que suas adaptações também sejam compartilhadas
  sob a mesma licença ou sob <a href="https://creativecommons.org/compatiblelicenses">licença compatível</a>.
</p>

<p align="center">
  <a href="http://creativecommons.org/licenses/by-sa/4.0/">
    <img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png">
  </a>
</p>

## Autores e colaboradores

* Prof. Jalerson Lima, Campus EaD/IFRN (http://jalerson.me)
