# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_03_28_132753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autores", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.integer "trabalho_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trabalho_id"], name: "index_autores_on_trabalho_id"
  end

  create_table "avaliacoes_trabalhos", id: :serial, force: :cascade do |t|
    t.integer "situacao"
    t.integer "atende_normas"
    t.integer "tematica_evento"
    t.integer "linha_tematica"
    t.integer "linha_id"
    t.integer "relevancia"
    t.integer "adequacao"
    t.integer "consistencia"
    t.integer "interlocucao"
    t.integer "originalidade"
    t.text "parecer"
    t.integer "trabalho_id"
    t.integer "organizador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linha_id"], name: "index_avaliacoes_trabalhos_on_linha_id"
    t.index ["organizador_id"], name: "index_avaliacoes_trabalhos_on_organizador_id"
    t.index ["trabalho_id"], name: "index_avaliacoes_trabalhos_on_trabalho_id"
  end

  create_table "certificados", id: :serial, force: :cascade do |t|
    t.text "texto"
    t.string "titulo"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_certificados_on_usuario_id"
  end

  create_table "cidades", id: :serial, force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.integer "estado_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "configs", id: :serial, force: :cascade do |t|
    t.boolean "dev"
    t.date "data_abertura_inscricoes"
    t.date "data_encerramento_inscricoes"
    t.date "data_inicio_submissao_trabalhos"
    t.date "data_termino_submissao_trabalhos"
    t.date "data_inicio_submissao_minicursos"
    t.date "data_termino_submissao_minicursos"
    t.date "data_inicio_inscricoes_minicursos"
    t.date "data_termino_inscricoes_minicursos"
    t.integer "prazo_redefinir_senha"
    t.integer "prazo_pagamento"
    t.integer "quantidade_maxima_inscricoes_minicursos"
    t.text "url_questionario_avaliacao"
    t.text "key_planilha_formulario_avaliacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "exibir_certificados"
  end

  create_table "estados", id: :serial, force: :cascade do |t|
    t.integer "codigo"
    t.string "nome"
    t.string "sigla"
    t.string "regiao"
    t.integer "pais_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inscricoes", id: :serial, force: :cascade do |t|
    t.integer "participante_id"
    t.integer "minicurso_id"
    t.boolean "certificado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["minicurso_id"], name: "index_inscricoes_on_minicurso_id"
    t.index ["participante_id"], name: "index_inscricoes_on_participante_id"
  end

  create_table "linhas", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "membros", id: :serial, force: :cascade do |t|
    t.integer "organizador_id"
    t.integer "linha_id"
    t.boolean "coordenador"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["linha_id"], name: "index_membros_on_linha_id"
    t.index ["organizador_id"], name: "index_membros_on_organizador_id"
  end

  create_table "minicursos", id: :serial, force: :cascade do |t|
    t.text "titulo"
    t.text "justificativa"
    t.text "objetivos"
    t.text "metodologia"
    t.text "programacao"
    t.text "material"
    t.text "referencias"
    t.integer "participante_id"
    t.integer "avaliacao"
    t.string "local"
    t.integer "vagas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participante_id"], name: "index_minicursos_on_participante_id"
  end

  create_table "organizadores", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "atuacao"
  end

  create_table "pagamentos", id: :serial, force: :cascade do |t|
    t.integer "participante_id"
    t.text "mp_preference"
    t.text "mp_payment"
    t.string "mp_id"
    t.text "mp_merchant_order"
    t.text "mp_init_point"
    t.date "prazo"
    t.float "valor"
    t.string "situacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participante_id"], name: "index_pagamentos_on_participante_id"
  end

  create_table "paises", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participantes", id: :serial, force: :cascade do |t|
    t.string "documento"
    t.integer "tipo_participante_id"
    t.integer "cidade_id"
    t.integer "pais_id"
    t.string "instituicao"
    t.boolean "possui_necessidades_especiais"
    t.text "necessidades_especiais"
    t.boolean "pago", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pagamento_por_empenho", default: false
    t.string "nota_empenho_file_name"
    t.string "nota_empenho_content_type"
    t.integer "nota_empenho_file_size"
    t.datetime "nota_empenho_updated_at"
    t.integer "minicurso_id"
    t.integer "isento"
    t.string "motivo_isencao"
    t.boolean "credenciado"
    t.boolean "respondeu_questionario", default: false
    t.index ["cidade_id"], name: "index_participantes_on_cidade_id"
    t.index ["minicurso_id"], name: "index_participantes_on_minicurso_id"
    t.index ["pais_id"], name: "index_participantes_on_pais_id"
    t.index ["tipo_participante_id"], name: "index_participantes_on_tipo_participante_id"
  end

  create_table "perfis", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_participantes", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_trabalhos", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trabalhos", id: :serial, force: :cascade do |t|
    t.text "titulo"
    t.text "resumo"
    t.integer "linha_id"
    t.integer "participante_id"
    t.integer "tipo_trabalho_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "arquivo_file_name"
    t.string "arquivo_content_type"
    t.integer "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.index ["linha_id"], name: "index_trabalhos_on_linha_id"
    t.index ["participante_id"], name: "index_trabalhos_on_participante_id"
    t.index ["tipo_trabalho_id"], name: "index_trabalhos_on_tipo_trabalho_id"
  end

  create_table "usuarios", id: :serial, force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "password_digest"
    t.integer "autenticavel_id"
    t.string "autenticavel_type"
    t.integer "perfil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "codigo_recuperar_senha"
    t.datetime "prazo_recuperacao_senha"
    t.string "matricula"
    t.index ["autenticavel_id"], name: "index_usuarios_on_autenticavel_id"
    t.index ["perfil_id"], name: "index_usuarios_on_perfil_id"
  end

  add_foreign_key "autores", "trabalhos"
  add_foreign_key "avaliacoes_trabalhos", "linhas"
  add_foreign_key "avaliacoes_trabalhos", "organizadores"
  add_foreign_key "avaliacoes_trabalhos", "trabalhos"
  add_foreign_key "certificados", "usuarios"
  add_foreign_key "cidades", "estados"
  add_foreign_key "inscricoes", "minicursos"
  add_foreign_key "inscricoes", "participantes"
  add_foreign_key "membros", "linhas"
  add_foreign_key "membros", "organizadores"
  add_foreign_key "minicursos", "participantes"
  add_foreign_key "pagamentos", "participantes"
  add_foreign_key "participantes", "cidades"
  add_foreign_key "participantes", "minicursos"
  add_foreign_key "participantes", "paises"
  add_foreign_key "participantes", "tipo_participantes"
  add_foreign_key "trabalhos", "linhas"
  add_foreign_key "trabalhos", "participantes"
  add_foreign_key "trabalhos", "tipo_trabalhos"
  add_foreign_key "usuarios", "perfis"
end
