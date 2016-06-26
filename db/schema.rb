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

ActiveRecord::Schema.define(version: 20160622142806) do

  create_table "avaliacoes_trabalhos", force: :cascade do |t|
    t.integer  "situacao",        limit: 4
    t.boolean  "atende_normas"
    t.boolean  "tematica_evento"
    t.integer  "tematica_linha",  limit: 4
    t.integer  "relevancia",      limit: 4
    t.integer  "adequacao",       limit: 4
    t.integer  "consistencia",    limit: 4
    t.integer  "interlocucao",    limit: 4
    t.integer  "originalidade",   limit: 4
    t.string   "parecer",         limit: 255
    t.integer  "linha_id",        limit: 4
    t.integer  "trabalho_id",     limit: 4
    t.integer  "organizador_id",  limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "avaliacoes_trabalhos", ["linha_id"], name: "index_avaliacoes_trabalhos_on_linha_id", using: :btree
  add_index "avaliacoes_trabalhos", ["organizador_id"], name: "index_avaliacoes_trabalhos_on_organizador_id", using: :btree
  add_index "avaliacoes_trabalhos", ["trabalho_id"], name: "index_avaliacoes_trabalhos_on_trabalho_id", using: :btree

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

  create_table "organizadores", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pagamentos", force: :cascade do |t|
    t.integer  "participante_id",    limit: 4
    t.text     "json",               limit: 65535
    t.date     "expira_em"
    t.string   "mercado_pago_id",    limit: 255
    t.text     "init_point",         limit: 65535
    t.text     "sandbox_init_point", limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "pagamentos", ["participante_id"], name: "index_pagamentos_on_participante_id", using: :btree

  create_table "paises", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "participantes", force: :cascade do |t|
    t.string   "nome",                          limit: 255
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
  end

  add_index "participantes", ["cidade_id"], name: "index_participantes_on_cidade_id", using: :btree
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
    t.string   "email",             limit: 255
    t.string   "password_digest",   limit: 255
    t.integer  "autenticavel_id",   limit: 4
    t.string   "autenticavel_type", limit: 255
    t.integer  "perfil_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "usuarios", ["autenticavel_id"], name: "index_usuarios_on_autenticavel_id", using: :btree
  add_index "usuarios", ["perfil_id"], name: "index_usuarios_on_perfil_id", using: :btree

  add_foreign_key "avaliacoes_trabalhos", "linhas"
  add_foreign_key "avaliacoes_trabalhos", "organizadores"
  add_foreign_key "avaliacoes_trabalhos", "trabalhos"
  add_foreign_key "cidades", "estados"
  add_foreign_key "membros", "linhas"
  add_foreign_key "membros", "organizadores"
  add_foreign_key "pagamentos", "participantes"
  add_foreign_key "participantes", "cidades"
  add_foreign_key "participantes", "paises"
  add_foreign_key "participantes", "tipo_participantes"
  add_foreign_key "trabalhos", "linhas"
  add_foreign_key "trabalhos", "participantes"
  add_foreign_key "trabalhos", "tipo_trabalhos"
  add_foreign_key "usuarios", "perfis"
end
