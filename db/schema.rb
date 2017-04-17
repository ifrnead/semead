# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170411172124) do

  create_table "autores", force: :cascade do |t|
    t.string   "nome",        limit: 255
    t.integer  "trabalho_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "autores", ["trabalho_id"], name: "index_autores_on_trabalho_id", using: :btree

  create_table "avaliacoes_trabalhos", force: :cascade do |t|
    t.integer  "situacao",        limit: 4
    t.integer  "atende_normas",   limit: 4
    t.integer  "tematica_evento", limit: 4
    t.integer  "linha_tematica",  limit: 4
    t.integer  "linha_id",        limit: 4
    t.integer  "relevancia",      limit: 4
    t.integer  "adequacao",       limit: 4
    t.integer  "consistencia",    limit: 4
    t.integer  "interlocucao",    limit: 4
    t.integer  "originalidade",   limit: 4
    t.text     "parecer",         limit: 65535
    t.integer  "trabalho_id",     limit: 4
    t.integer  "organizador_id",  limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "avaliacoes_trabalhos", ["linha_id"], name: "index_avaliacoes_trabalhos_on_linha_id", using: :btree
  add_index "avaliacoes_trabalhos", ["organizador_id"], name: "index_avaliacoes_trabalhos_on_organizador_id", using: :btree
  add_index "avaliacoes_trabalhos", ["trabalho_id"], name: "index_avaliacoes_trabalhos_on_trabalho_id", using: :btree

  create_table "certificados", force: :cascade do |t|
    t.text     "texto",      limit: 65535
    t.integer  "usuario_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "titulo",     limit: 255
  end

  add_index "certificados", ["usuario_id"], name: "index_certificados_on_usuario_id", using: :btree

  create_table "cidades", force: :cascade do |t|
    t.integer  "codigo",     limit: 4
    t.string   "nome",       limit: 255
    t.integer  "estado_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.integer  "codigo",     limit: 4
    t.string   "nome",       limit: 255
    t.string   "sigla",      limit: 255
    t.string   "regiao",     limit: 255
    t.integer  "pais_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "linhas", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "membros", force: :cascade do |t|
    t.integer  "organizador_id", limit: 4
    t.integer  "linha_id",       limit: 4
    t.boolean  "coordenador"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "membros", ["linha_id"], name: "index_membros_on_linha_id", using: :btree
  add_index "membros", ["organizador_id"], name: "index_membros_on_organizador_id", using: :btree

  create_table "minicursos", force: :cascade do |t|
    t.text     "titulo",          limit: 65535
    t.text     "justificativa",   limit: 65535
    t.text     "objetivos",       limit: 65535
    t.text     "metodologia",     limit: 65535
    t.text     "programacao",     limit: 65535
    t.text     "material",        limit: 65535
    t.text     "referencias",     limit: 65535
    t.integer  "participante_id", limit: 4
    t.integer  "avaliacao",       limit: 4
    t.string   "local",           limit: 255
    t.integer  "vagas",           limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "minicursos", ["participante_id"], name: "index_minicursos_on_participante_id", using: :btree

  create_table "organizadores", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "atuacao",    limit: 255
  end

  create_table "pagamentos", force: :cascade do |t|
    t.integer  "participante_id",   limit: 4
    t.text     "mp_preference",     limit: 65535
    t.text     "mp_payment",        limit: 65535
    t.string   "mp_id",             limit: 255
    t.text     "mp_merchant_order", limit: 65535
    t.text     "mp_init_point",     limit: 65535
    t.date     "prazo"
    t.float    "valor",             limit: 24
    t.string   "situacao",          limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "pagamentos", ["participante_id"], name: "index_pagamentos_on_participante_id", using: :btree

  create_table "paises", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "participantes", force: :cascade do |t|
    t.string   "documento",                     limit: 255
    t.integer  "tipo_participante_id",          limit: 4
    t.integer  "cidade_id",                     limit: 4
    t.integer  "pais_id",                       limit: 4
    t.string   "instituicao",                   limit: 255
    t.boolean  "possui_necessidades_especiais"
    t.text     "necessidades_especiais",        limit: 65535
    t.boolean  "pago",                                        default: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.boolean  "pagamento_por_empenho",                       default: false
    t.string   "nota_empenho_file_name",        limit: 255
    t.string   "nota_empenho_content_type",     limit: 255
    t.integer  "nota_empenho_file_size",        limit: 4
    t.datetime "nota_empenho_updated_at"
    t.integer  "minicurso_id",                  limit: 4
    t.integer  "isento",                        limit: 4
    t.string   "motivo_isencao",                limit: 255
    t.boolean  "credenciado", default: false
  end

  add_index "participantes", ["cidade_id"], name: "index_participantes_on_cidade_id", using: :btree
  add_index "participantes", ["minicurso_id"], name: "index_participantes_on_minicurso_id", using: :btree
  add_index "participantes", ["pais_id"], name: "index_participantes_on_pais_id", using: :btree
  add_index "participantes", ["tipo_participante_id"], name: "index_participantes_on_tipo_participante_id", using: :btree

  create_table "perfis", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_participantes", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tipo_trabalhos", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "trabalhos", force: :cascade do |t|
    t.text     "titulo",               limit: 65535
    t.text     "resumo",               limit: 65535
    t.integer  "linha_id",             limit: 4
    t.integer  "participante_id",      limit: 4
    t.integer  "tipo_trabalho_id",     limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "arquivo_file_name",    limit: 255
    t.string   "arquivo_content_type", limit: 255
    t.integer  "arquivo_file_size",    limit: 4
    t.datetime "arquivo_updated_at"
  end

  add_index "trabalhos", ["linha_id"], name: "index_trabalhos_on_linha_id", using: :btree
  add_index "trabalhos", ["participante_id"], name: "index_trabalhos_on_participante_id", using: :btree
  add_index "trabalhos", ["tipo_trabalho_id"], name: "index_trabalhos_on_tipo_trabalho_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome",                    limit: 255
    t.string   "email",                   limit: 255
    t.string   "password_digest",         limit: 255
    t.integer  "autenticavel_id",         limit: 4
    t.string   "autenticavel_type",       limit: 255
    t.integer  "perfil_id",               limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "codigo_recuperar_senha",  limit: 255
    t.datetime "prazo_recuperacao_senha"
  end

  add_index "usuarios", ["autenticavel_id"], name: "index_usuarios_on_autenticavel_id", using: :btree
  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree

  add_foreign_key "autores", "trabalhos"
  add_foreign_key "avaliacoes_trabalhos", "linhas"
  add_foreign_key "avaliacoes_trabalhos", "organizadores"
  add_foreign_key "avaliacoes_trabalhos", "trabalhos"
  add_foreign_key "certificados", "usuarios"
  add_foreign_key "cidades", "estados"
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
